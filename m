Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A74142557E
	for <lists.virtualization@lfdr.de>; Thu,  7 Oct 2021 16:33:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8498860FE9;
	Thu,  7 Oct 2021 14:33:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a24C0YB-SeNB; Thu,  7 Oct 2021 14:33:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2E5FB60FE6;
	Thu,  7 Oct 2021 14:33:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6C87C000D;
	Thu,  7 Oct 2021 14:33:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3A2DC000D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Oct 2021 14:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B07B54083C
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Oct 2021 14:33:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ibm.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R9zvA2WVPMbR
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Oct 2021 14:33:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DE2040831
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Oct 2021 14:33:14 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 197E23fN020503; 
 Thu, 7 Oct 2021 10:33:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=NoNLb9O2Ylblm/UT4O7Gwa5G1mVfnGxhcTyqUTBS/Uc=;
 b=Lgf+IMnky8RA4LGUUKxABDm0r25FNaEt7AwQYybt02Vw4Z0+8oDbqVCGt0c5axMiK7uM
 YmQ80BCbIm/j9txNteL3ZywLBiNeZ++dtifGEoZviSSJsvsOlpiMs8s86X3/zn5M2m8y
 7YaCaH0LCXV2Gqo1mdCx4vlLlaVFbqnam3HD97fNxsujUF8K5KhC6TvvhXNNEslcjz3f
 MUSCAWp7ykYkh9r1lNBDGmSHkpRvJW0A6KXnitVr+GTtESgbXOWToFgIg9N6uumfZU3K
 YHR0iLIt5E945qOkWWSh26F7DjhKUoaqhesYLVHTya76WX3Wh4UruGSV5LYj6LdzT4M5 DA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bj2a60vqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Oct 2021 10:33:12 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 197E2EE0021020;
 Thu, 7 Oct 2021 10:33:11 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bj2a60vpr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Oct 2021 10:33:11 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 197ERxsQ029185;
 Thu, 7 Oct 2021 14:33:09 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 3bef2antge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Oct 2021 14:33:09 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 197EX3lt57999802
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Oct 2021 14:33:03 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E89E152077;
 Thu,  7 Oct 2021 14:33:02 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.45.119])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 32E0B52052;
 Thu,  7 Oct 2021 14:32:58 +0000 (GMT)
Date: Thu, 7 Oct 2021 16:32:55 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 1/1] virtio: write back F_VERSION_1 before validate
Message-ID: <20211007163255.61d95513.pasic@linux.ibm.com>
In-Reply-To: <875yu9yruv.fsf@redhat.com>
References: <20211006142533.2735019-1-pasic@linux.ibm.com>
 <875yu9yruv.fsf@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qeK7nbZ2KeUM7JcqUzlrqeLx442UyBNv
X-Proofpoint-GUID: QajmWxVzsbJhM8yN1H-5c34I4WM2FG8d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-07_02,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110070097
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Halil Pasic <pasic@linux.ibm.com>, Xie Yongji <xieyongji@bytedance.com>,
 stefanha@redhat.com, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
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

On Thu, 07 Oct 2021 13:52:24 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Wed, Oct 06 2021, Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > The virtio specification virtio-v1.1-cs01 states: Transitional devices
> > MUST detect Legacy drivers by detecting that VIRTIO_F_VERSION_1 has not
> > been acknowledged by the driver.  This is exactly what QEMU as of 6.1
> > has done relying solely on VIRTIO_F_VERSION_1 for detecting that.
> >
> > However, the specification also says: driver MAY read (but MUST NOT
> > write) the device-specific configuration fields to check that it can
> > support the device before setting FEATURES_OK.  
> 
> Suggest to put the citations from the spec into quotes, so that they are
> distinguishable from the rest of the text.

For the record: I basically took Michael's description, the one which you
said you prefer, with some minor changes.

This is one of the changes, which renders this a paraphrase and not a
quote. Michael didn't use quotation marks so I was not sure it is was
a word by word quote anyway. It was. But the spec depends on "During this
step" which does not make any sense without the context. That is why I made
the end of step explicit.

I think we are fine without quotation marks. Those who care can read the
spec.

> 
> >
> > In that case, any transitional device relying solely on
> > VIRTIO_F_VERSION_1 for detecting legacy drivers will return data in
> > legacy format.  In particular, this implies that it is in big endian
> > format for big endian guests. This naturally confuses the driver which
> > expects little endian in the modern mode.
> >
> > It is probably a good idea to amend the spec to clarify that
> > VIRTIO_F_VERSION_1 can only be relied on after the feature negotiation
> > is complete. However, we already have regression so let's try to address  
> 
> s/regression/a regression/
> 

Yes. Was like this in the original. Will change

> > it.  
> 
> Maybe mention what the regression is?

How about the following?

The regressions affect the VIRTIO_NET_F_MTU feature of virtio-net and the
VIRTIO_BLK_F_BLK_SIZE feature of virtio-blk for BE guests when virtio
1.0 is used on both sides. The latter renders virtio-blk unusable with
DASD backing, because things simply don't work with the default.

> 
> Also mention that we use this workaround for modern on BE only?

We have that already, don't we. The sentence that starts with "In
particular". The regression description should reinforce that
sufficiently IMHO.

> 
> >
> > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > Fixes: 82e89ea077b9 ("virtio-blk: Add validation for block size in config space")
> > Fixes: fe36cbe0671e ("virtio_net: clear MTU when out of range")
> > Reported-by: markver@us.ibm.com
> > ---
> >  drivers/virtio/virtio.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> > index 0a5b54034d4b..494cfecd3376 100644
> > --- a/drivers/virtio/virtio.c
> > +++ b/drivers/virtio/virtio.c
> > @@ -239,6 +239,16 @@ static int virtio_dev_probe(struct device *_d)
> >  		driver_features_legacy = driver_features;
> >  	}
> >  
> > +	/*
> > +	 * Some devices detect legacy solely via F_VERSION_1. Write
> > +	 * F_VERSION_1 to force LE for these when needed.  
> 
> "...to force LE config space accesses before FEATURES_OK for these when
> needed (BE)."
> 
> ?

Can do, but I would rather omit the (BE) at the end. All the conditions
are necessary:
* have validate callback
* device offered VERSION_1
* virtio legacy is be

> 
> > +	 */
> > +	if (drv->validate && !virtio_legacy_is_little_endian()
> > +			  && BIT_ULL(VIRTIO_F_VERSION_1) & device_features) {  
> 
> Nit: putting device_features first would read more naturally to me.
> 

Can do.

> > +		dev->features = BIT_ULL(VIRTIO_F_VERSION_1);
> > +		dev->config->finalize_features(dev);
> > +	}
> > +
> >  	if (device_features & (1ULL << VIRTIO_F_VERSION_1))
> >  		dev->features = driver_features & device_features;
> >  	else  
> 
> Patch LGTM.
> 
> 

Thanks for having a look. If you are fine with the proposed solution
please tell me, so I can send out a v2.

If not let us work towards an acceptable solution.

Regards,
Halil
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
