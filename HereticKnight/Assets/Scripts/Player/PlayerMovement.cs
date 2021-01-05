using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    public float maxVelocity;

    public Vector3 currentVelocity = new Vector3(); 
    // Start is called before the first frame update
    void Start()
    {
        Debug.Log("Something");
    }

    // Update is called once per frame
    void Update()
    {
        

    }
    private void FixedUpdate()
    {
        if (Input.GetKey("w"))
        {
            currentVelocity += new Vector3(0, 1, 0);
        }
        if (Input.GetKey("a"))
        {
            currentVelocity += new Vector3(-1, 0, 0);
        }
        if (Input.GetKey("s"))
        {
            currentVelocity += new Vector3(0, -1, 0);
        }
        if (Input.GetKey("d"))
        {
            currentVelocity += new Vector3(1, 0, 0);
        }
        currentVelocity *= (maxVelocity/Mathf.Pow(2,6));

        this.gameObject.transform.position += currentVelocity;


    }
}
