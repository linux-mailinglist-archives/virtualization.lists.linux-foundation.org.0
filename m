Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 401A742BED9
	for <lists.virtualization@lfdr.de>; Wed, 13 Oct 2021 13:24:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDB43406F1;
	Wed, 13 Oct 2021 11:24:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id abs9wP-QU_QA; Wed, 13 Oct 2021 11:24:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8FD7940707;
	Wed, 13 Oct 2021 11:24:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16567C0022;
	Wed, 13 Oct 2021 11:24:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE136C000D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 Oct 2021 11:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 923C04070A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 Oct 2021 11:24:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QrmvDn8LOLDQ
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 Oct 2021 11:24:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C202E406F1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 Oct 2021 11:24:07 +0000 (UTC)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19D9ihA8024150; 
 Wed, 13 Oct 2021 07:24:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=E/CRiS9YKBGOipiZLMur3q/Gu9YWSpriqGljYzhvoLk=;
 b=qUb4A8LUqXMxe9NOmZwgO/NhGO3cIsui3mJTnSXJfm2o6DAUmSJ2ILHdp7mlgpJDgZmN
 3E6ePsp+O7Aa8goCMqqmsIO2XPaZK9xaxiyiOJXDxHO7KEoEKGTcBerBSJUDHDHHRoL6
 0wjcCQRXKnu9UKbtdnlMVTZoDty0cqTmd9mDLh9S9LtHM1kYCXkUUkbU1c5Gw3zTMmnp
 cJb3+ftDtTDYbT4GlymSZkzZJHHad6kMQyxWgonJUM/NI6T5XdJiqc5JdfqkT5wXNaLv
 /jEvOl3JlacJULN2obiBBSI7NX3HVZZNWnlqxi58cP1BOoFWkY3OCOWtkzFvr6fDwiLZ Gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bnqmp8tj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 07:24:05 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19DAq2ds026142;
 Wed, 13 Oct 2021 07:24:05 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bnqmp8thd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 07:24:04 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19DBFcNt013781;
 Wed, 13 Oct 2021 11:24:02 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 3bk2qafun1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 11:24:01 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 19DBIKJG46137814
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Oct 2021 11:18:21 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08D7E52075;
 Wed, 13 Oct 2021 11:23:56 +0000 (GMT)
Received: from li-43c5434c-23b8-11b2-a85c-c4958fb47a68.ibm.com (unknown
 [9.171.3.131])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id C5C0C5205A;
 Wed, 13 Oct 2021 11:23:51 +0000 (GMT)
Subject: Re: [PATCH v3 1/1] virtio: write back F_VERSION_1 before validate
To: "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
References: <20211011053921.1198936-1-pasic@linux.ibm.com>
 <20211013060923-mutt-send-email-mst@kernel.org>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <96561e29-e0d6-9a4d-3657-999bad59914e@de.ibm.com>
Date: Wed, 13 Oct 2021 13:23:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211013060923-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HT3wu4tdw-asF-6Di5ricBV3R2j4XXRu
X-Proofpoint-ORIG-GUID: gXUvvXMpnSzkMBewd-1wAXM9mg8j7MD9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-13_03,2021-10-13_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1011 mlxscore=0 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110130071
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com, qemu-devel@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Xie Yongji <xieyongji@bytedance.com>, stefanha@redhat.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>



Am 13.10.21 um 12:10 schrieb Michael S. Tsirkin:
> On Mon, Oct 11, 2021 at 07:39:21AM +0200, Halil Pasic wrote:
>> The virtio specification virtio-v1.1-cs01 states: "Transitional devices
>> MUST detect Legacy drivers by detecting that VIRTIO_F_VERSION_1 has not
>> been acknowledged by the driver."  This is exactly what QEMU as of 6.1
>> has done relying solely on VIRTIO_F_VERSION_1 for detecting that.
>>
>> However, the specification also says: "... the driver MAY read (but MUST
>> NOT write) the device-specific configuration fields to check that it can
>> support the device ..." before setting FEATURES_OK.
>>
>> In that case, any transitional device relying solely on
>> VIRTIO_F_VERSION_1 for detecting legacy drivers will return data in
>> legacy format.  In particular, this implies that it is in big endian
>> format for big endian guests. This naturally confuses the driver which
>> expects little endian in the modern mode.
>>
>> It is probably a good idea to amend the spec to clarify that
>> VIRTIO_F_VERSION_1 can only be relied on after the feature negotiation
>> is complete. Before validate callback existed, config space was only
>> read after FEATURES_OK. However, we already have two regressions, so
>> let's address this here as well.
>>
>> The regressions affect the VIRTIO_NET_F_MTU feature of virtio-net and
>> the VIRTIO_BLK_F_BLK_SIZE feature of virtio-blk for BE guests when
>> virtio 1.0 is used on both sides. The latter renders virtio-blk unusable
>> with DASD backing, because things simply don't work with the default.
>> See Fixes tags for relevant commits.
>>
>> For QEMU, we can work around the issue by writing out the feature bits
>> with VIRTIO_F_VERSION_1 bit set.  We (ab)use the finalize_features
>> config op for this. This isn't enough to address all vhost devices since
>> these do not get the features until FEATURES_OK, however it looks like
>> the affected devices actually never handled the endianness for legacy
>> mode correctly, so at least that's not a regression.
>>
>> No devices except virtio net and virtio blk seem to be affected.
>>
>> Long term the right thing to do is to fix the hypervisors.
>>
>> Cc: <stable@vger.kernel.org> #v4.11
>> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
>> Fixes: 82e89ea077b9 ("virtio-blk: Add validation for block size in config space")
>> Fixes: fe36cbe0671e ("virtio_net: clear MTU when out of range")
>> Reported-by: markver@us.ibm.com
>> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> 
> OK this looks good! How about a QEMU patch to make it spec compliant on
> BE?

Who is going to do that? Halil? you? Conny?

Can we get this kernel patch queued for 5.15 and stable without waiting for the QEMU patch
as we have a regression with 4.14?
> 
>> ---
>>
>> @Connie: I made some more commit message changes to accommodate Michael's
>> requests. I just assumed these will work or you as well and kept your
>> r-b. Please shout at me if it needs to be dropped :)
>> ---
>>   drivers/virtio/virtio.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
>> index 0a5b54034d4b..236081afe9a2 100644
>> --- a/drivers/virtio/virtio.c
>> +++ b/drivers/virtio/virtio.c
>> @@ -239,6 +239,17 @@ static int virtio_dev_probe(struct device *_d)
>>   		driver_features_legacy = driver_features;
>>   	}
>>   
>> +	/*
>> +	 * Some devices detect legacy solely via F_VERSION_1. Write
>> +	 * F_VERSION_1 to force LE config space accesses before FEATURES_OK for
>> +	 * these when needed.
>> +	 */
>> +	if (drv->validate && !virtio_legacy_is_little_endian()
>> +			  && device_features & BIT_ULL(VIRTIO_F_VERSION_1)) {
>> +		dev->features = BIT_ULL(VIRTIO_F_VERSION_1);
>> +		dev->config->finalize_features(dev);
>> +	}
>> +
>>   	if (device_features & (1ULL << VIRTIO_F_VERSION_1))
>>   		dev->features = driver_features & device_features;
>>   	else
>>
>> base-commit: 60a9483534ed0d99090a2ee1d4bb0b8179195f51
>> -- 
>> 2.25.1
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
