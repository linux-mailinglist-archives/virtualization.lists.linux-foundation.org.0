Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6340610D5A5
	for <lists.virtualization@lfdr.de>; Fri, 29 Nov 2019 13:25:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ADC7386C4F;
	Fri, 29 Nov 2019 12:25:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U6zWjeyxoW_m; Fri, 29 Nov 2019 12:25:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2BEAE86C3A;
	Fri, 29 Nov 2019 12:25:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10598C1DE2;
	Fri, 29 Nov 2019 12:25:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D77EDC0881
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 Nov 2019 12:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C4FE220387
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 Nov 2019 12:25:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SBM2wPyyN-Bm
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 Nov 2019 12:25:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id BE2C420368
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 Nov 2019 12:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575030301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dRF9j5r9muNuE8Iv0Fr4lQhKRYCXnS9axqA6mDzv1bw=;
 b=I8QMcDwbnptasY5OTyuCl6SYyMk83MbxKUB2c2sPGB14GbE3hf/EoCTE1UHiDfo3ApgJJV
 WcGiavP4IoXuRUe8giiWHV3X/0qmTrC7eyz67l+h1oLKiSiJEJRM7sAdEygNwp42rjXrM/
 SXcBV5OHLC309UZqsBkfLJOcjINNnBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-sgoxaXQMP4mQM1KCcoQ-RA-1; Fri, 29 Nov 2019 07:25:00 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B748780183C;
 Fri, 29 Nov 2019 12:24:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED9D7600C8;
 Fri, 29 Nov 2019 12:24:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E808711AB5; Fri, 29 Nov 2019 13:24:54 +0100 (CET)
Date: Fri, 29 Nov 2019 13:24:54 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] drm/qxl: Complete exception handling in qxl_device_init()
Message-ID: <20191129122454.2xoi43kaowmqppm5@sirius.home.kraxel.org>
References: <5e5ef9c4-4d85-3c93-cf28-42cfcb5b0649@web.de>
MIME-Version: 1.0
In-Reply-To: <5e5ef9c4-4d85-3c93-cf28-42cfcb5b0649@web.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: sgoxaXQMP4mQM1KCcoQ-RA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: David Airlie <airlied@linux.ie>, Kangjie Lu <kjlu@umn.edu>,
 Stephen McCamant <smccaman@umn.edu>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Navid Emamdoost <emamd001@umn.edu>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 spice-devel@lists.freedesktop.org, Anton Vasilyev <vasilyev@ispras.ru>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDY6MTg6MTRQTSArMDEwMCwgTWFya3VzIEVsZnJpbmcg
d3JvdGU6Cj4gRnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2Uu
bmV0Pgo+IERhdGU6IFRodSwgNyBOb3YgMjAxOSAxODowNTowOCArMDEwMAo+IAo+IEEgY29jY2lj
aGVjayBydW4gcHJvdmlkZWQgaW5mb3JtYXRpb24gbGlrZSB0aGUgZm9sbG93aW5nLgo+IAo+IGRy
aXZlcnMvZ3B1L2RybS9xeGwvcXhsX2ttcy5jOjI5NToxLTc6IEVSUk9SOiBtaXNzaW5nIGlvdW5t
YXA7Cj4gaW9yZW1hcCBvbiBsaW5lIDE3OCBhbmQgZXhlY3V0aW9uIHZpYSBjb25kaXRpb25hbCBv
biBsaW5lIDE4NQo+IAo+IEdlbmVyYXRlZCBieTogc2NyaXB0cy9jb2NjaW5lbGxlL2ZyZWUvaW91
bm1hcC5jb2NjaQo+IAo+IEEganVtcCB0YXJnZXQgd2FzIHNwZWNpZmllZCBpbiBhbiBpZiBicmFu
Y2guIFRoZSBjb3JyZXNwb25kaW5nIGZ1bmN0aW9uCj4gY2FsbCBkaWQgbm90IHJlbGVhc2UgdGhl
IGRlc2lyZWQgc3lzdGVtIHJlc291cmNlIHRoZW4uCj4gVGh1cyB1c2UgdGhlIGxhYmVsIOKAnHJv
bV91bm1hcOKAnSBpbnN0ZWFkIHRvIGZpeCB0aGUgZXhjZXB0aW9uIGhhbmRsaW5nCj4gZm9yIHRo
aXMgZnVuY3Rpb24gaW1wbGVtZW50YXRpb24uCj4gCj4gRml4ZXM6IDUwNDMzNDhhNDk2OWFlMTY2
MWMwMDhlZmU5MjlhYmQwZDc2ZTM3OTIgKCJkcm06IHF4bDogRml4IGVycm9yIGhhbmRsaW5nIGF0
IHF4bF9kZXZpY2VfaW5pdCIpCj4gU2lnbmVkLW9mZi1ieTogTWFya3VzIEVsZnJpbmcgPGVsZnJp
bmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgoKUHVzaGVkIHRvIGRybS1taXNjLW5leHQuCgp0aGFu
a3MsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
