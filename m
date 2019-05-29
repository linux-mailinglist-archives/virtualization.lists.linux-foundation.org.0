Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DFB2DCCB
	for <lists.virtualization@lfdr.de>; Wed, 29 May 2019 14:27:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EDE952565;
	Wed, 29 May 2019 12:27:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A3D8F2524
	for <virtualization@lists.linux-foundation.org>;
	Wed, 29 May 2019 12:24:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DA3A8881
	for <virtualization@lists.linux-foundation.org>;
	Wed, 29 May 2019 12:24:48 +0000 (UTC)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4TCOMiu094513 for <virtualization@lists.linux-foundation.org>;
	Wed, 29 May 2019 08:24:48 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2ssre1c79m-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Wed, 29 May 2019 08:24:47 -0400
Received: from localhost
	by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<mimu@linux.ibm.com>; Wed, 29 May 2019 13:24:45 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
	by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Wed, 29 May 2019 13:24:41 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
	[9.149.105.61])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4TCOdup9437350
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 29 May 2019 12:24:40 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C951311C050;
	Wed, 29 May 2019 12:24:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 47A6311C052;
	Wed, 29 May 2019 12:24:39 +0000 (GMT)
Received: from [9.152.96.222] (unknown [9.152.96.222])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 29 May 2019 12:24:39 +0000 (GMT)
Subject: Re: [PATCH v2 3/8] s390/cio: add basic protected virtualization
	support
To: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
References: <20190523162209.9543-1-mimu@linux.ibm.com>
	<20190523162209.9543-4-mimu@linux.ibm.com>
	<20190527123802.54cd3589.cohuck@redhat.com>
	<20190527143014.3b48a0d2.pasic@linux.ibm.com>
	<20190527153130.0f473ffd.cohuck@redhat.com>
From: Michael Mueller <mimu@linux.ibm.com>
Organization: IBM
Date: Wed, 29 May 2019 14:24:39 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190527153130.0f473ffd.cohuck@redhat.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19052912-0008-0000-0000-000002EB93C4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052912-0009-0000-0000-000022586493
Message-Id: <e794bad2-5fc2-b30c-972e-b586770a0065@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-29_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905290082
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
	Christoph Hellwig <hch@infradead.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
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



On 27.05.19 15:31, Cornelia Huck wrote:
> On Mon, 27 May 2019 14:30:14 +0200
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
>> On Mon, 27 May 2019 12:38:02 +0200
>> Cornelia Huck <cohuck@redhat.com> wrote:
>>
>>> On Thu, 23 May 2019 18:22:04 +0200
>>> Michael Mueller <mimu@linux.ibm.com> wrote:
>>>    
>>>> From: Halil Pasic <pasic@linux.ibm.com>
>>>>
>>>> As virtio-ccw devices are channel devices, we need to use the dma area
>>>> for any communication with the hypervisor.
>>>>
>>>> It handles neither QDIO in the common code, nor any device type specific
>>>> stuff (like channel programs constructed by the DASD driver).
>>>>
>>>> An interesting side effect is that virtio structures are now going to
>>>> get allocated in 31 bit addressable storage.
>>>>
>>>> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
>>>
>>> [Side note: you really should add your s-o-b if you send someone else's
>>> patches... if Halil ends up committing them, it's fine, though.]
>>>    
>>>> ---
>>>>   arch/s390/include/asm/ccwdev.h   |  4 +++
>>>>   drivers/s390/cio/ccwreq.c        |  9 +++---
>>>>   drivers/s390/cio/device.c        | 64 +++++++++++++++++++++++++++++++++-------
>>>>   drivers/s390/cio/device_fsm.c    | 53 ++++++++++++++++++++-------------
>>>>   drivers/s390/cio/device_id.c     | 20 +++++++------
>>>>   drivers/s390/cio/device_ops.c    | 21 +++++++++++--
>>>>   drivers/s390/cio/device_pgid.c   | 22 +++++++-------
>>>>   drivers/s390/cio/device_status.c | 24 +++++++--------
>>>>   drivers/s390/cio/io_sch.h        | 20 +++++++++----
>>>>   drivers/s390/virtio/virtio_ccw.c | 10 -------
>>>>   10 files changed, 164 insertions(+), 83 deletions(-)
>>>>    
>>>
>>> (...)
>>>    
>>>> @@ -1593,20 +1622,31 @@ struct ccw_device * __init ccw_device_create_console(struct ccw_driver *drv)
>>>>   		return ERR_CAST(sch);
>>>>   
>>>>   	io_priv = kzalloc(sizeof(*io_priv), GFP_KERNEL | GFP_DMA);
>>>> -	if (!io_priv) {
>>>> -		put_device(&sch->dev);
>>>> -		return ERR_PTR(-ENOMEM);
>>>> -	}
>>>> +	if (!io_priv)
>>>> +		goto err_priv;
>>>> +	io_priv->dma_area = dma_alloc_coherent(&sch->dev,
>>>> +				sizeof(*io_priv->dma_area),
>>>> +				&io_priv->dma_area_dma, GFP_KERNEL);
>>>
>>> Even though we'll only end up here for 3215 or 3270 consoles, this sent
>>> me looking.
>>>
>>> This code is invoked via console_init(). A few lines down in
>>> start_kernel(), we have
>>>
>>>          /*
>>>           * This needs to be called before any devices perform DMA
>>>           * operations that might use the SWIOTLB bounce buffers. It will
>>>           * mark the bounce buffers as decrypted so that their usage will
>>>           * not cause "plain-text" data to be decrypted when accessed.
>>>           */
>>>          mem_encrypt_init();
>>>
>>> So, I'm wondering if creating the console device interacts in any way
>>> with the memory encryption interface?
>>
>> I do things a bit different than x86: the SWIOTLB stuff is set up in
>> mem_init(). So I think we should be fine. If there is a down-side to
>> calling swiotlb_update_mem_attributes() earlier, honestly I'm
>> not sure.
> 
> Neither am I; do any of the folks who looked at the swiotlb patch have
> an idea?
> 
>>
>>>
>>> [Does basic recognition work if you start a protected virt guest with a
>>> 3270 console? I realize that the console is unlikely to work, but that
>>> should at least exercise this code path.]
>>
>> I've already had some thoughts along these lines and slapped
>> -device x-terminal3270,chardev=char_0,devno=fe.0.000a,id=terminal_0 \
>> on my qemu command line. The ccw device does show up in the guest...
>>
>> Device   Subchan.  DevType CU Type Use  PIM PAM POM  CHPIDs
>> ----------------------------------------------------------------------
>> 0.0.0000 0.0.0000  0000/00 3832/01 yes  80  80  ff   00000000 00000000
>> 0.0.000a 0.0.0001  0000/00 3270/00      80  80  ff   01000000 00000000
>> 0.0.0002 0.0.0002  0000/00 3832/09 yes  80  80  ff   00000000 00000000
>> 0.0.0300 0.0.0003  0000/00 3832/02 yes  80  80  ff   00000000 00000000
>> 0.0.0301 0.0.0004  0000/00 3832/02 yes  80  80  ff   00000000 00000000
>>
>> But I would not call it a comprehensive test...
> 
> If you only add the device, it will show up as a normal ccw device in
> the guest; i.e. device recognition is done at the same time as for the
> other ccw devices. Still good to see that nothing breaks there :)
> 
> To actually make the guest use the 3270 as its console, I guess you
> need to explicitly force it (see
> https://wiki.qemu.org/Features/3270#Using_3270_as_the_console)...
> actually starting the console will almost certainly fail; but you can
> at least check whether device recognition in the console path works.
> 
>>
>> Mimu, do we have something more elaborate with regards to this?

I ran that with success

[root@ap01 ~]# lscss | grep 3270
0.0.002a 0.0.0008  0000/00 3270/00 yes  80  80  ff   01000000 00000000

and was able to connect and login.

Michael

> 
> I don't think we need extensive testing here; just checking that the
> sequence is not fundamentally broken.
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
