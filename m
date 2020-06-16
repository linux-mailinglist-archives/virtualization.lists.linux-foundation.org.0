Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3F81FAEA6
	for <lists.virtualization@lfdr.de>; Tue, 16 Jun 2020 12:53:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 127A425C8A;
	Tue, 16 Jun 2020 10:53:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tobCdODdbuvg; Tue, 16 Jun 2020 10:53:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2CB99259C9;
	Tue, 16 Jun 2020 10:53:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13904C016E;
	Tue, 16 Jun 2020 10:53:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 161E2C016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 10:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F25D2261E4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 10:53:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y3du7UJbAL7l
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 10:53:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by silver.osuosl.org (Postfix) with ESMTPS id 6A2FE259C9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 10:53:03 +0000 (UTC)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05GAVD7s012471; Tue, 16 Jun 2020 06:52:57 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31pjnayuk7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 06:52:57 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05GAVRfu013411;
 Tue, 16 Jun 2020 06:52:56 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31pjnayujb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 06:52:56 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05GAk93I029967;
 Tue, 16 Jun 2020 10:52:55 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 31mpe856fq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 10:52:54 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05GAqps163897766
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jun 2020 10:52:51 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC36B4C040;
 Tue, 16 Jun 2020 10:52:51 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 022204C04A;
 Tue, 16 Jun 2020 10:52:51 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.26.88])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jun 2020 10:52:50 +0000 (GMT)
Subject: Re: [PATCH v2 1/1] s390: virtio: let arch accept devices without
 IOMMU feature
To: Halil Pasic <pasic@linux.ibm.com>
References: <1592224764-1258-1-git-send-email-pmorel@linux.ibm.com>
 <1592224764-1258-2-git-send-email-pmorel@linux.ibm.com>
 <20200616115202.0285aa08.pasic@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <ef235cc9-9d4b-1247-c01a-9dd1c63f437c@linux.ibm.com>
Date: Tue, 16 Jun 2020 12:52:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616115202.0285aa08.pasic@linux.ibm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_04:2020-06-15,
 2020-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 priorityscore=1501 cotscore=-2147483648 malwarescore=0 clxscore=1011
 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006160075
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 frankja@linux.ibm.com, kvm@vger.kernel.org, mst@redhat.com,
 Heiko Carstens <heiko.carstens@de.ibm.com>, cohuck@redhat.com,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, borntraeger@de.ibm.com,
 thomas.lendacky@amd.com, David Gibson <david@gibson.dropbear.id.au>
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



On 2020-06-16 11:52, Halil Pasic wrote:
> On Mon, 15 Jun 2020 14:39:24 +0200
> Pierre Morel <pmorel@linux.ibm.com> wrote:
> 
> I find the subject (commit short) sub optimal. The 'arch' is already
> accepting devices 'without IOMMU feature'. What you are introducing is
> the ability to reject.
> 
>> An architecture protecting the guest memory against unauthorized host
>> access may want to enforce VIRTIO I/O device protection through the
>> use of VIRTIO_F_IOMMU_PLATFORM.
>>
>> Let's give a chance to the architecture to accept or not devices
>> without VIRTIO_F_IOMMU_PLATFORM.
>>
> 
> I don't particularly like the commit message. In general, I believe
> using access_platform instead of iommu_platform would really benefit us.

IOMMU_PLATFORM is used overall in Linux, and I did not find any 
occurrence for ACCESS_PLATFORM.


> 
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   arch/s390/mm/init.c     | 6 ++++++
>>   drivers/virtio/virtio.c | 9 +++++++++
>>   include/linux/virtio.h  | 2 ++
>>   3 files changed, 17 insertions(+)
>>
>> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
>> index 87b2d024e75a..3f04ad09650f 100644
>> --- a/arch/s390/mm/init.c
>> +++ b/arch/s390/mm/init.c
>> @@ -46,6 +46,7 @@
>>   #include <asm/kasan.h>
>>   #include <asm/dma-mapping.h>
>>   #include <asm/uv.h>
>> +#include <linux/virtio.h>
> 
> arch/s390/mm/init.c including virtio.h looks a bit strange to me, but
> if Heiko and Vasily don't mind, neither do I.

Do we have a better place to install the hook?
I though that since it is related to memory management and that, since 
force_dma_unencrypted already is there, it would be a good place.

However, kvm-s390 is another candidate.

> 
>>   
>>   pgd_t swapper_pg_dir[PTRS_PER_PGD] __section(.bss..swapper_pg_dir);
>>   
>> @@ -162,6 +163,11 @@ bool force_dma_unencrypted(struct device *dev)
>>   	return is_prot_virt_guest();
>>   }
>>   
>> +int arch_needs_iommu_platform(struct virtio_device *dev)
> 
> Maybe prefixing the name with virtio_ would help provide the
> proper context.

The virtio_dev makes it obvious and from the virtio side it should be 
obvious that the arch is responsible for this.

However if nobody has something against I change it.

> 
>> +{
>> +	return is_prot_virt_guest();
>> +}
>> +
>>   /* protected virtualization */
>>   static void pv_init(void)
>>   {
>> diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
>> index a977e32a88f2..30091089bee8 100644
>> --- a/drivers/virtio/virtio.c
>> +++ b/drivers/virtio/virtio.c
>> @@ -167,6 +167,11 @@ void virtio_add_status(struct virtio_device *dev, unsigned int status)
>>   }
>>   EXPORT_SYMBOL_GPL(virtio_add_status);
>>   
>> +int __weak arch_needs_iommu_platform(struct virtio_device *dev)
>> +{
>> +	return 0;
>> +}
>> +
> 
> Adding some people that could be interested in overriding this as well
> to the cc list.

Thanks,

> 
>>   int virtio_finalize_features(struct virtio_device *dev)
>>   {
>>   	int ret = dev->config->finalize_features(dev);
>> @@ -179,6 +184,10 @@ int virtio_finalize_features(struct virtio_device *dev)
>>   	if (!virtio_has_feature(dev, VIRTIO_F_VERSION_1))
>>   		return 0;
>>   
>> +	if (arch_needs_iommu_platform(dev) &&
>> +		!virtio_has_feature(dev, VIRTIO_F_IOMMU_PLATFORM))
>> +		return -EIO;
>> +
> 
> Why EIO?

Because I/O can not occur correctly?
I am open to suggestions.

> 
> Overall, I think it is a good idea to have something that is going to
> protect us from this scenario.
> 

It would clearly be a good thing that trusted hypervizors like QEMU 
forbid this scenario however should we let the door open?

Thanks,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
