Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BC233188
	for <lists.virtualization@lfdr.de>; Mon,  3 Jun 2019 15:53:18 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 29829DDF;
	Mon,  3 Jun 2019 13:53:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D49E22F
	for <virtualization@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 13:53:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5D814854
	for <virtualization@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 13:53:06 +0000 (UTC)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x53DmMre122607 for <virtualization@lists.linux-foundation.org>;
	Mon, 3 Jun 2019 09:53:05 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2sw3tjbh0p-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Mon, 03 Jun 2019 09:53:05 -0400
Received: from localhost
	by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<mimu@linux.ibm.com>; Mon, 3 Jun 2019 14:53:03 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
	by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Mon, 3 Jun 2019 14:52:59 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
	[9.149.105.59])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x53Dqvbf60817556
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 3 Jun 2019 13:52:57 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B0685A4055;
	Mon,  3 Jun 2019 13:52:57 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 29F66A4053;
	Mon,  3 Jun 2019 13:52:57 +0000 (GMT)
Received: from [9.152.98.28] (unknown [9.152.98.28])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon,  3 Jun 2019 13:52:57 +0000 (GMT)
Subject: Re: [PATCH v3 3/8] s390/cio: add basic protected virtualization
	support
To: Cornelia Huck <cohuck@redhat.com>
References: <20190529122657.166148-1-mimu@linux.ibm.com>
	<20190529122657.166148-4-mimu@linux.ibm.com>
	<20190603140649.7d5ebc3e.cohuck@redhat.com>
	<18348fed-07d1-a11f-215c-f09ac94e9fbf@linux.ibm.com>
	<20190603154230.0a4bfaf3.cohuck@redhat.com>
From: Michael Mueller <mimu@linux.ibm.com>
Organization: IBM
Date: Mon, 3 Jun 2019 15:52:56 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190603154230.0a4bfaf3.cohuck@redhat.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19060313-0016-0000-0000-000002832F5A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060313-0017-0000-0000-000032E03A16
Message-Id: <76d85a87-a031-ddf3-0e6a-a66455041824@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-06-03_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1906030099
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vasily Gorbik <gor@linux.ibm.com>,
	Linux-S390 Mailing List <linux-s390@vger.kernel.org>,
	Thomas Huth <thuth@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
	KVM Mailing List <kvm@vger.kernel.org>,
	Sebastian Ott <sebott@linux.ibm.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Pierre Morel <pmorel@linux.ibm.com>, Farhan Ali <alifm@linux.ibm.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Viktor Mihajlovski <mihajlov@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Reply-To: mimu@linux.ibm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org



On 03.06.19 15:42, Cornelia Huck wrote:
> On Mon, 3 Jun 2019 14:45:03 +0200
> Michael Mueller <mimu@linux.ibm.com> wrote:
> 
>> On 03.06.19 14:06, Cornelia Huck wrote:
>>> On Wed, 29 May 2019 14:26:52 +0200
>>> Michael Mueller <mimu@linux.ibm.com> wrote:
> 
>>>> @@ -1593,20 +1625,31 @@ struct ccw_device * __init ccw_device_create_console(struct ccw_driver *drv)
>>>>    		return ERR_CAST(sch);
>>>>    
>>>>    	io_priv = kzalloc(sizeof(*io_priv), GFP_KERNEL | GFP_DMA);
>>>> -	if (!io_priv) {
>>>> -		put_device(&sch->dev);
>>>> -		return ERR_PTR(-ENOMEM);
>>>> -	}
>>>> +	if (!io_priv)
>>>> +		goto err_priv;
>>>> +	io_priv->dma_area = dma_alloc_coherent(&sch->dev,
>>>> +				sizeof(*io_priv->dma_area),
>>>> +				&io_priv->dma_area_dma, GFP_KERNEL);
>>>> +	if (!io_priv->dma_area)
>>>> +		goto err_dma_area;
>>>>    	set_io_private(sch, io_priv);
>>>>    	cdev = io_subchannel_create_ccwdev(sch);
>>>>    	if (IS_ERR(cdev)) {
>>>>    		put_device(&sch->dev);
>>>> +		dma_free_coherent(&sch->dev, sizeof(*io_priv->dma_area),
>>>> +				  io_priv->dma_area, io_priv->dma_area_dma);
>>>>    		kfree(io_priv);
>>>
>>> <pre-existing, not introduced by this patch>
>>> Shouldn't that branch do set_io_private(sch, NULL)? Not sure if any
>>> code would make use of it, but it's probably better to clean out
>>> references to freed objects.
>>
>> Added behind kfree(). I hope nobody asks for a separate patch. ;)
> 
> I would probably have added it just before the kfree, but I'm not
> asking for a separate patch ;)

I moved it.

> 
>>
>>> </pre-existing, not introduced by this patch>
>>>    
>>>>    		return cdev;
>>>>    	}
>>>>    	cdev->drv = drv;
>>>>    	ccw_device_set_int_class(cdev);
>>>>    	return cdev;
>>>> +
>>>> +err_dma_area:
>>>> +	kfree(io_priv);
>>>> +err_priv:
>>>> +	put_device(&sch->dev);
>>>> +	return ERR_PTR(-ENOMEM);
>>>>    }
>>>>    
>>>>    void __init ccw_device_destroy_console(struct ccw_device *cdev)
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
