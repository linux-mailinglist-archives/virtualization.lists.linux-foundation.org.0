Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB4B1FAFAA
	for <lists.virtualization@lfdr.de>; Tue, 16 Jun 2020 13:58:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6A961890E6;
	Tue, 16 Jun 2020 11:58:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ntwmHdMM82bb; Tue, 16 Jun 2020 11:58:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AEAEA885D6;
	Tue, 16 Jun 2020 11:58:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D110C0895;
	Tue, 16 Jun 2020 11:58:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5527FC016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 11:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 49A7588585
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 11:58:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WsbX4JOzzph7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 11:58:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 97FF08817D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 11:58:02 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05GBVkN5176896; Tue, 16 Jun 2020 07:57:56 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31pc7qdxth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 07:57:56 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05GBlCB6032338;
 Tue, 16 Jun 2020 07:57:56 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31pc7qdxsc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 07:57:55 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05GBtjk4016289;
 Tue, 16 Jun 2020 11:57:53 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 31mpe7w980-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 11:57:53 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05GBvoDl60555284
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jun 2020 11:57:50 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A55BC4C046;
 Tue, 16 Jun 2020 11:57:50 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC4D14C040;
 Tue, 16 Jun 2020 11:57:49 +0000 (GMT)
Received: from oc2783563651 (unknown [9.145.56.227])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jun 2020 11:57:49 +0000 (GMT)
Date: Tue, 16 Jun 2020 13:57:26 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v2 1/1] s390: virtio: let arch accept devices without
 IOMMU feature
Message-ID: <20200616135726.04fa8314.pasic@linux.ibm.com>
In-Reply-To: <ef235cc9-9d4b-1247-c01a-9dd1c63f437c@linux.ibm.com>
References: <1592224764-1258-1-git-send-email-pmorel@linux.ibm.com>
 <1592224764-1258-2-git-send-email-pmorel@linux.ibm.com>
 <20200616115202.0285aa08.pasic@linux.ibm.com>
 <ef235cc9-9d4b-1247-c01a-9dd1c63f437c@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_04:2020-06-15,
 2020-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0
 clxscore=1015 cotscore=-2147483648 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006160084
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, 16 Jun 2020 12:52:50 +0200
Pierre Morel <pmorel@linux.ibm.com> wrote:

> >>   int virtio_finalize_features(struct virtio_device *dev)
> >>   {
> >>   	int ret = dev->config->finalize_features(dev);
> >> @@ -179,6 +184,10 @@ int virtio_finalize_features(struct virtio_device *dev)
> >>   	if (!virtio_has_feature(dev, VIRTIO_F_VERSION_1))
> >>   		return 0;
> >>   
> >> +	if (arch_needs_iommu_platform(dev) &&
> >> +		!virtio_has_feature(dev, VIRTIO_F_IOMMU_PLATFORM))
> >> +		return -EIO;
> >> +  
> > 
> > Why EIO?  
> 
> Because I/O can not occur correctly?
> I am open to suggestions.

We use -ENODEV if feature when the device rejects the features we
tried to negotiate (see virtio_finalize_features()) and -EINVAL when
the F_VERSION_1 and the virtio-ccw revision ain't coherent (in
virtio_ccw_finalize_features()). Any of those seems more fitting
that EIO to me. BTW does the error code itself matter in any way,
or is it just OK vs some error?

Regards,
Halil
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
