Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6854223CF
	for <lists.virtualization@lfdr.de>; Tue,  5 Oct 2021 12:46:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D09E583B8D;
	Tue,  5 Oct 2021 10:46:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BeRs0vxSK-c6; Tue,  5 Oct 2021 10:46:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 95BDA83B67;
	Tue,  5 Oct 2021 10:46:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0CB17C001E;
	Tue,  5 Oct 2021 10:46:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D4013C000D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Oct 2021 10:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2C4683B66
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Oct 2021 10:46:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rit3NPv1EP_p
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Oct 2021 10:46:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BCB583B5A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Oct 2021 10:46:44 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1959g0I1007011; 
 Tue, 5 Oct 2021 06:46:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=deadNT7igQA5kiktClWxY+e0NuQjlhQ0rN218pA/ZNk=;
 b=QZFEvcfGhMXktUtgPOybyKH43qDP/m8rrpZkeAdxzxnPFbMbEZM4vR6g0bf3lpfuvL6m
 TPdzTdjNmnFNT4OVwitGcpqLZ2NkX+dhirE20HG6KmCcpMPv8MjSdk+f7ZIvF7OAwNBp
 mvWGHjjLCOACIuCnNRHq0rYzPxfnFIcAtSJIlX0eRhQ9wusuoNVND7jsi15DpxBBlIlU
 BIugvVHCDn+T5WDjWOR52jrGSmIb/FqwI2hdd6Iaf8FqLZ+0ITHLqpcxYNOupbCX5hsk
 cOFzNKDgFgameiQd9IpVFCvVaJXdzvcT1MA336hmrJ9xLp6nHBcVepXxnGe1B1blayzj mQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bgma4sdfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 06:46:43 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 195Akh86025213;
 Tue, 5 Oct 2021 06:46:43 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bgma4sdey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 06:46:43 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 195AhClO009016;
 Tue, 5 Oct 2021 10:46:41 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3bef2a17gq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 10:46:41 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 195Akbrj5309060
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Oct 2021 10:46:37 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B73EDAE081;
 Tue,  5 Oct 2021 10:46:37 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC792AE089;
 Tue,  5 Oct 2021 10:46:36 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.45.119])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  5 Oct 2021 10:46:36 +0000 (GMT)
Date: Tue, 5 Oct 2021 12:46:34 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH 1/1] virtio: write back features before verify
Message-ID: <20211005124634.2a774796.pasic@linux.ibm.com>
In-Reply-To: <20211005035014-mutt-send-email-mst@kernel.org>
References: <20210930012049.3780865-1-pasic@linux.ibm.com>
 <20210930070444-mutt-send-email-mst@kernel.org>
 <20211001092125.64fef348.pasic@linux.ibm.com>
 <20211002055605-mutt-send-email-mst@kernel.org>
 <87bl452d90.fsf@redhat.com>
 <20211004090018-mutt-send-email-mst@kernel.org>
 <20211005092539.145c9cc4.pasic@linux.ibm.com>
 <20211005035014-mutt-send-email-mst@kernel.org>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dISC-4Fas47o_uRyUynz0RAGrkvMT9az
X-Proofpoint-GUID: tCE_4RJXbd3HchYj9DxiZqvQ87w1z1GS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110050061
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com,
 Xie Yongji <xieyongji@bytedance.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, linux-kernel@vger.kernel.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 virtualization@lists.linux-foundation.org
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

On Tue, 5 Oct 2021 03:53:17 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> > Wouldn't a call from transport code into virtio core
> > be more handy? What I have in mind is stuff like vhost-user and vdpa. My
> > understanding is, that for vhost setups where the config is outside qemu,
> > we probably need a new  command that tells the vhost backend what
> > endiannes to use for config. I don't think we can use
> > VHOST_USER_SET_VRING_ENDIAN because  that one is on a virtqueue basis
> > according to the doc. So for vhost-user and similar we would fire that
> > command and probably also set the filed, while for devices for which
> > control plane is handled by QEMU we would just set the field.
> > 
> > Does that sound about right?  
> 
> I'm fine either way, but when would you invoke this?
> With my idea backends can check the field when get_config
> is invoked.
> 
> As for using this in VHOST, can we maybe re-use SET_FEATURES?
> 
> Kind of hacky but nice in that it will actually make existing backends
> work...

Basically the equivalent of this patch, just on the vhost interface,
right? Could work I have to look into it :)
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
