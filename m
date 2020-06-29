Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BE25C20D007
	for <lists.virtualization@lfdr.de>; Mon, 29 Jun 2020 18:10:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 75CB188603;
	Mon, 29 Jun 2020 16:10:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PgwUG9lEXaUe; Mon, 29 Jun 2020 16:10:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B280E885E4;
	Mon, 29 Jun 2020 16:10:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B757C016E;
	Mon, 29 Jun 2020 16:10:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5400C016E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 16:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BF13887559
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 16:10:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0sRRrP3_umGT
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 16:10:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A93E98748B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 16:10:54 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05TFajYC188023; Mon, 29 Jun 2020 12:10:49 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ydmqmpxk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 12:10:49 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05TGAm7D150990;
 Mon, 29 Jun 2020 12:10:48 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ydmqmpw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 12:10:48 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05TG6QpM016445;
 Mon, 29 Jun 2020 16:10:46 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 31wyyase64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 16:10:46 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05TGAhQt46924020
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Jun 2020 16:10:43 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B4444C05A;
 Mon, 29 Jun 2020 16:10:43 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C08124C046;
 Mon, 29 Jun 2020 16:10:40 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.79.64])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 29 Jun 2020 16:10:40 +0000 (GMT)
Subject: Re: [PATCH v3 1/1] s390: virtio: let arch accept devices without
 IOMMU feature
To: Cornelia Huck <cohuck@redhat.com>
References: <1592390637-17441-1-git-send-email-pmorel@linux.ibm.com>
 <1592390637-17441-2-git-send-email-pmorel@linux.ibm.com>
 <20200618002956.5f179de4.pasic@linux.ibm.com>
 <20200619112051.74babdb1.cohuck@redhat.com>
 <7fe6e9ab-fd5a-3f92-1f3a-f9e6805d3730@linux.ibm.com>
 <20200629154439.14cc5ae7.cohuck@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <4777633f-728b-1a67-c870-0fafa313e468@linux.ibm.com>
Date: Mon, 29 Jun 2020 18:10:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200629154439.14cc5ae7.cohuck@redhat.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-06-29_15:2020-06-29,
 2020-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 cotscore=-2147483648 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006290105
Cc: gor@linux.ibm.com, linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 kvm@vger.kernel.org, mst@redhat.com, heiko.carstens@de.ibm.com,
 linuxram@us.ibm.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Halil Pasic <pasic@linux.ibm.com>,
 borntraeger@de.ibm.com, thomas.lendacky@amd.com, david@gibson.dropbear.id.au
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



On 2020-06-29 15:44, Cornelia Huck wrote:
> On Mon, 29 Jun 2020 15:14:04 +0200
> Pierre Morel <pmorel@linux.ibm.com> wrote:
> 
>> On 2020-06-19 11:20, Cornelia Huck wrote:
>>> On Thu, 18 Jun 2020 00:29:56 +0200
>>> Halil Pasic <pasic@linux.ibm.com> wrote:
>>>    
>>>> On Wed, 17 Jun 2020 12:43:57 +0200
>>>> Pierre Morel <pmorel@linux.ibm.com> wrote:
> 
>>>>> @@ -179,6 +194,13 @@ int virtio_finalize_features(struct virtio_device *dev)
>>>>>    	if (!virtio_has_feature(dev, VIRTIO_F_VERSION_1))
>>>>>    		return 0;
>>>>>    
>>>>> +	if (arch_needs_virtio_iommu_platform(dev) &&
>>>>> +		!virtio_has_feature(dev, VIRTIO_F_IOMMU_PLATFORM)) {
>>>>> +		dev_warn(&dev->dev,
>>>>> +			 "virtio: device must provide VIRTIO_F_IOMMU_PLATFORM\n");
> 
> [Side note: wasn't there a patch renaming this bit on the list? I think
> this name is only kept for userspace compat.]

Sorry, I do not understand what you expect from me.
On which mailing list you think there is a patch on?

> 
>>>>
>>>> I'm not sure, divulging the current Linux name of this feature bit is a
>>>> good idea, but if everybody else is fine with this, I don't care that
>>>
>>> Not sure if that feature name will ever change, as it is exported in
>>> headers. At most, we might want to add the new ACCESS_PLATFORM define
>>> and keep the old one, but that would still mean some churn.
>>>    
>>>> much. An alternative would be:
>>>> "virtio: device falsely claims to have full access to the memory,
>>>> aborting the device"
>>>
>>> "virtio: device does not work with limited memory access" ?
>>>
>>> But no issue with keeping the current message.
>>>    
>>
>> If it is OK, I would like to specify that the arch is responsible to
>> accept or not the device.
>> The reason why the device is not accepted without IOMMU_PLATFORM is arch
>> specific.
> 
> Hm, I'd think the reason is always the same (the device cannot access
> the memory directly), just the way to figure out whether that is the
> case or not is arch-specific, as with so many other things. No real
> need to go into detail here, I think.
> 

As you like, so I rename the subject to:
"virtio: device does not work with limited memory access"

Regards,

Pierre


-- 
Pierre Morel
IBM Lab Boeblingen
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
