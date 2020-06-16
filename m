Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2821FB244
	for <lists.virtualization@lfdr.de>; Tue, 16 Jun 2020 15:36:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2D54A888C7;
	Tue, 16 Jun 2020 13:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yJBXwxYt6m5g; Tue, 16 Jun 2020 13:36:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 90C8A887F7;
	Tue, 16 Jun 2020 13:36:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B835C016E;
	Tue, 16 Jun 2020 13:36:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70808C016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 13:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5F553887E9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 13:36:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nwa1hEMoGoK2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 13:36:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0EE02887F7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 13:36:48 +0000 (UTC)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05GDVVjT101545; Tue, 16 Jun 2020 09:36:42 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31pg44s0dm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 09:36:42 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05GDWxXi108139;
 Tue, 16 Jun 2020 09:36:41 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31pg44s0cg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 09:36:41 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05GDLgiQ009521;
 Tue, 16 Jun 2020 13:36:39 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 31mpe826fu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 13:36:39 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05GDaaQU9830446
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jun 2020 13:36:36 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 873684C04E;
 Tue, 16 Jun 2020 13:36:36 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0C594C04A;
 Tue, 16 Jun 2020 13:36:35 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.26.88])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jun 2020 13:36:35 +0000 (GMT)
Subject: Re: [PATCH v2 1/1] s390: virtio: let arch accept devices without
 IOMMU feature
To: Cornelia Huck <cohuck@redhat.com>
References: <1592224764-1258-1-git-send-email-pmorel@linux.ibm.com>
 <1592224764-1258-2-git-send-email-pmorel@linux.ibm.com>
 <20200616115202.0285aa08.pasic@linux.ibm.com>
 <ef235cc9-9d4b-1247-c01a-9dd1c63f437c@linux.ibm.com>
 <20200616142010.04b7ba19.cohuck@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <8ba494d2-ad91-bc5c-2df8-b9d81c435211@linux.ibm.com>
Date: Tue, 16 Jun 2020 15:36:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616142010.04b7ba19.cohuck@redhat.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_04:2020-06-16,
 2020-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 cotscore=-2147483648 bulkscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 adultscore=0 mlxlogscore=834
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006160097
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 frankja@linux.ibm.com, kvm@vger.kernel.org, mst@redhat.com,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Halil Pasic <pasic@linux.ibm.com>, borntraeger@de.ibm.com,
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



On 2020-06-16 14:20, Cornelia Huck wrote:
> On Tue, 16 Jun 2020 12:52:50 +0200
> Pierre Morel <pmorel@linux.ibm.com> wrote:
> 
>> On 2020-06-16 11:52, Halil Pasic wrote:
>>> On Mon, 15 Jun 2020 14:39:24 +0200
>>> Pierre Morel <pmorel@linux.ibm.com> wrote:
> 
>>>> @@ -162,6 +163,11 @@ bool force_dma_unencrypted(struct device *dev)
>>>>    	return is_prot_virt_guest();
>>>>    }
>>>>    
>>>> +int arch_needs_iommu_platform(struct virtio_device *dev)
>>>
>>> Maybe prefixing the name with virtio_ would help provide the
>>> proper context.
>>
>> The virtio_dev makes it obvious and from the virtio side it should be
>> obvious that the arch is responsible for this.
>>
>> However if nobody has something against I change it.
> 
> arch_needs_virtio_iommu_platform()?

fine with me

-- 
Pierre Morel
IBM Lab Boeblingen
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
