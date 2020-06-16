Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 865C71FB258
	for <lists.virtualization@lfdr.de>; Tue, 16 Jun 2020 15:41:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F19B124B78;
	Tue, 16 Jun 2020 13:41:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nof0lIN5XXmf; Tue, 16 Jun 2020 13:41:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 705DA25AB8;
	Tue, 16 Jun 2020 13:41:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B44BC016E;
	Tue, 16 Jun 2020 13:41:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5820C016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 13:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8B37420334
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 13:41:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZupkK4rFhfES
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 13:41:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by silver.osuosl.org (Postfix) with ESMTPS id 5CA1624B78
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 13:41:33 +0000 (UTC)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05GDWfeE050969; Tue, 16 Jun 2020 09:41:27 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31px7ra82p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 09:41:27 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05GDXnfg056120;
 Tue, 16 Jun 2020 09:41:26 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31px7ra81b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 09:41:26 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05GDeB8T007445;
 Tue, 16 Jun 2020 13:41:24 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 31mpe85e2d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 13:41:24 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05GDfLr862193970
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jun 2020 13:41:21 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 300264C04A;
 Tue, 16 Jun 2020 13:41:21 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 778D84C04E;
 Tue, 16 Jun 2020 13:41:20 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.26.88])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jun 2020 13:41:20 +0000 (GMT)
Subject: Re: [PATCH v2 1/1] s390: virtio: let arch accept devices without
 IOMMU feature
To: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
References: <1592224764-1258-1-git-send-email-pmorel@linux.ibm.com>
 <1592224764-1258-2-git-send-email-pmorel@linux.ibm.com>
 <20200616115202.0285aa08.pasic@linux.ibm.com>
 <ef235cc9-9d4b-1247-c01a-9dd1c63f437c@linux.ibm.com>
 <20200616135726.04fa8314.pasic@linux.ibm.com>
 <20200616141744.61b3a139.cohuck@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <e130c5e7-40e5-40a8-eac3-c2d17c90ee7b@linux.ibm.com>
Date: Tue, 16 Jun 2020 15:41:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616141744.61b3a139.cohuck@redhat.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_04:2020-06-16,
 2020-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 lowpriorityscore=0 cotscore=-2147483648 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006160097
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 frankja@linux.ibm.com, kvm@vger.kernel.org, mst@redhat.com,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 borntraeger@de.ibm.com, thomas.lendacky@amd.com,
 David Gibson <david@gibson.dropbear.id.au>
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



On 2020-06-16 14:17, Cornelia Huck wrote:
> On Tue, 16 Jun 2020 13:57:26 +0200
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
>> On Tue, 16 Jun 2020 12:52:50 +0200
>> Pierre Morel <pmorel@linux.ibm.com> wrote:
>>
>>>>>    int virtio_finalize_features(struct virtio_device *dev)
>>>>>    {
>>>>>    	int ret = dev->config->finalize_features(dev);
>>>>> @@ -179,6 +184,10 @@ int virtio_finalize_features(struct virtio_device *dev)
>>>>>    	if (!virtio_has_feature(dev, VIRTIO_F_VERSION_1))
>>>>>    		return 0;
>>>>>    
>>>>> +	if (arch_needs_iommu_platform(dev) &&
>>>>> +		!virtio_has_feature(dev, VIRTIO_F_IOMMU_PLATFORM))
>>>>> +		return -EIO;
>>>>> +
>>>>
>>>> Why EIO?
>>>
>>> Because I/O can not occur correctly?
>>> I am open to suggestions.
>>
>> We use -ENODEV if feature when the device rejects the features we
>> tried to negotiate (see virtio_finalize_features()) and -EINVAL when
>> the F_VERSION_1 and the virtio-ccw revision ain't coherent (in
>> virtio_ccw_finalize_features()). Any of those seems more fitting
>> that EIO to me. BTW does the error code itself matter in any way,
>> or is it just OK vs some error?
> 
> If I haven't lost my way, we end up in the driver core probe failure
> handling; we probably should do -ENODEV if we just want probing to fail
> and -EINVAL or -EIO if we want the code to moan.
> 

what about returning -ENODEV and add a dedicated warning here?

-- 
Pierre Morel
IBM Lab Boeblingen
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
