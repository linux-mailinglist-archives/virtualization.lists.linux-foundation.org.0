Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 694AB421F62
	for <lists.virtualization@lfdr.de>; Tue,  5 Oct 2021 09:26:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5366240210;
	Tue,  5 Oct 2021 07:26:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZE9cJtpg0Z22; Tue,  5 Oct 2021 07:26:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B992740293;
	Tue,  5 Oct 2021 07:26:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3A9DCC001E;
	Tue,  5 Oct 2021 07:26:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE83AC000D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Oct 2021 07:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7B774078A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Oct 2021 07:26:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ibm.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qmGCcG5CQQ51
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Oct 2021 07:26:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3E5C40782
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Oct 2021 07:26:21 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1956ai5K006023; 
 Tue, 5 Oct 2021 03:26:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=PRP3XC71ks3K/eXBA18uRQOABwYCF7SJb1De18qjsI0=;
 b=B0zQGKwYXq/xvgHfidZgWFo4IinBnF1pcAonlgvF5Rf/S5J0EldeFfKYYpHTIsLddsID
 E97ajKbpUwSI0gSLsLNIZjsVqowHkJEEM/BgiQa8G4cPt3w3UJ5fQVayTmiR17kxiq0w
 PkgcNiY3mZKKi7fE7RhWYLtZ5jiAiXM4vZnY1C8nj798U08aGKqjW9AMhOodBz42n50G
 fGKmvrP+W2jFjEhzLGVi8CuwQLqDet2QRZppPy6kwOkqPPZuMUqk3IoX+TquTy/I38cd
 p+9HBJjBbQTF4FjmF8bV7mrnFwbWX9yO8yFUq68QjUskJwL88i3qOo9z+gdQX2Jjf8pE UA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bggbcten4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 03:26:19 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1956uC8E006135;
 Tue, 5 Oct 2021 03:26:19 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bggbctemm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 03:26:19 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1957DFGn009790;
 Tue, 5 Oct 2021 07:26:17 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3bef29n7ca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 07:26:16 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1957KnR646334430
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Oct 2021 07:20:49 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB77DA4060;
 Tue,  5 Oct 2021 07:26:05 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EC9DA4066;
 Tue,  5 Oct 2021 07:26:01 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.45.119])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  5 Oct 2021 07:26:00 +0000 (GMT)
Date: Tue, 5 Oct 2021 09:25:39 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH 1/1] virtio: write back features before verify
Message-ID: <20211005092539.145c9cc4.pasic@linux.ibm.com>
In-Reply-To: <20211004090018-mutt-send-email-mst@kernel.org>
References: <20210930012049.3780865-1-pasic@linux.ibm.com>
 <20210930070444-mutt-send-email-mst@kernel.org>
 <20211001092125.64fef348.pasic@linux.ibm.com>
 <20211002055605-mutt-send-email-mst@kernel.org>
 <87bl452d90.fsf@redhat.com>
 <20211004090018-mutt-send-email-mst@kernel.org>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -F2P042FRLjgFARHmllaFsm-zqvz094d
X-Proofpoint-ORIG-GUID: xxy95EbSVU-JOjLT_dASGOoXfDN5fZVl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110050040
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Halil Pasic <pasic@linux.ibm.com>,
 Xie Yongji <xieyongji@bytedance.com>
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

On Mon, 4 Oct 2021 09:11:04 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> > >> static inline bool virtio_access_is_big_endian(VirtIODevice *vdev)
> > >> {
> > >> #if defined(LEGACY_VIRTIO_IS_BIENDIAN)
> > >>     return virtio_is_big_endian(vdev);
> > >> #elif defined(TARGET_WORDS_BIGENDIAN)
> > >>     if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
> > >>         /* Devices conforming to VIRTIO 1.0 or later are always LE. */
> > >>         return false;
> > >>     }
> > >>     return true;
> > >> #else
> > >>     return false;
> > >> #endif
> > >> }
> > >>   
> > >
> > > ok so that's a QEMU bug. Any virtio 1.0 and up
> > > compatible device must use LE.
> > > It can also present a legacy config space where the
> > > endian depends on the guest.  
> > 
> > So, how is the virtio core supposed to determine this? A
> > transport-specific callback?  
> 
> I'd say a field in VirtIODevice is easiest.

Wouldn't a call from transport code into virtio core
be more handy? What I have in mind is stuff like vhost-user and vdpa. My
understanding is, that for vhost setups where the config is outside qemu,
we probably need a new  command that tells the vhost backend what
endiannes to use for config. I don't think we can use
VHOST_USER_SET_VRING_ENDIAN because  that one is on a virtqueue basis
according to the doc. So for vhost-user and similar we would fire that
command and probably also set the filed, while for devices for which
control plane is handled by QEMU we would just set the field.

Does that sound about right?


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
