Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 415ED20CEB7
	for <lists.virtualization@lfdr.de>; Mon, 29 Jun 2020 15:14:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EBB3389369;
	Mon, 29 Jun 2020 13:14:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bTNaQkJlqYRp; Mon, 29 Jun 2020 13:14:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8530389395;
	Mon, 29 Jun 2020 13:14:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59856C08A0;
	Mon, 29 Jun 2020 13:14:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9718DC016E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 13:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8632589394
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 13:14:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KIlwLbbuW1Os
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 13:14:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F265E89369
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 13:14:29 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05TDDoaj110929; Mon, 29 Jun 2020 09:14:22 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31ycg2j394-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 09:14:22 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05TD5mQt066402;
 Mon, 29 Jun 2020 09:14:21 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31ycg2j386-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 09:14:21 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05TDB5tJ007572;
 Mon, 29 Jun 2020 13:14:19 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 31wwr8ac50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 13:14:19 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05TDCvaS59965942
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Jun 2020 13:12:57 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC98A11C04C;
 Mon, 29 Jun 2020 13:14:16 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11FC011C058;
 Mon, 29 Jun 2020 13:14:05 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.28.234])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 29 Jun 2020 13:14:04 +0000 (GMT)
Subject: Re: [PATCH v3 1/1] s390: virtio: let arch accept devices without
 IOMMU feature
To: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
References: <1592390637-17441-1-git-send-email-pmorel@linux.ibm.com>
 <1592390637-17441-2-git-send-email-pmorel@linux.ibm.com>
 <20200618002956.5f179de4.pasic@linux.ibm.com>
 <20200619112051.74babdb1.cohuck@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <7fe6e9ab-fd5a-3f92-1f3a-f9e6805d3730@linux.ibm.com>
Date: Mon, 29 Jun 2020 15:14:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200619112051.74babdb1.cohuck@redhat.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-29_11:2020-06-29,
 2020-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 malwarescore=0 cotscore=-2147483648 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006290089
Cc: gor@linux.ibm.com, linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 kvm@vger.kernel.org, mst@redhat.com, heiko.carstens@de.ibm.com,
 linuxram@us.ibm.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, borntraeger@de.ibm.com,
 thomas.lendacky@amd.com, david@gibson.dropbear.id.au
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



On 2020-06-19 11:20, Cornelia Huck wrote:
> On Thu, 18 Jun 2020 00:29:56 +0200
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
>> On Wed, 17 Jun 2020 12:43:57 +0200
>> Pierre Morel <pmorel@linux.ibm.com> wrote:
...
>>
>> But since this can be rewritten any time, let's go with the option
>> people already agree with, instead of more discussion.
> 
> Yes, there's nothing wrong with the patch as-is.
> 
> Acked-by: Cornelia Huck <cohuck@redhat.com>

Thanks,


> 
> Which tree should this go through? Virtio? s390? >
>>
>> Just another question. Do we want this backported? Do we need cc stable?
> 
> It does change behaviour of virtio-ccw devices; but then, it only
> fences off configurations that would not have worked anyway.
> Distributions should probably pick this; but I do not consider it
> strictly a "fix" (more a mitigation for broken configurations), so I'm
> not sure whether stable applies.
> 
>> [..]
>>
>>
>>>   int virtio_finalize_features(struct virtio_device *dev)
>>>   {
>>>   	int ret = dev->config->finalize_features(dev);
>>> @@ -179,6 +194,13 @@ int virtio_finalize_features(struct virtio_device *dev)
>>>   	if (!virtio_has_feature(dev, VIRTIO_F_VERSION_1))
>>>   		return 0;
>>>   
>>> +	if (arch_needs_virtio_iommu_platform(dev) &&
>>> +		!virtio_has_feature(dev, VIRTIO_F_IOMMU_PLATFORM)) {
>>> +		dev_warn(&dev->dev,
>>> +			 "virtio: device must provide VIRTIO_F_IOMMU_PLATFORM\n");
>>
>> I'm not sure, divulging the current Linux name of this feature bit is a
>> good idea, but if everybody else is fine with this, I don't care that
> 
> Not sure if that feature name will ever change, as it is exported in
> headers. At most, we might want to add the new ACCESS_PLATFORM define
> and keep the old one, but that would still mean some churn.
> 
>> much. An alternative would be:
>> "virtio: device falsely claims to have full access to the memory,
>> aborting the device"
> 
> "virtio: device does not work with limited memory access" ?
> 
> But no issue with keeping the current message.
> 

If it is OK, I would like to specify that the arch is responsible to 
accept or not the device.
The reason why the device is not accepted without IOMMU_PLATFORM is arch 
specific.

Regards,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
