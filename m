Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DB828ECFF
	for <lists.virtualization@lfdr.de>; Thu, 15 Oct 2020 08:15:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C4ABB882DC;
	Thu, 15 Oct 2020 06:15:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3reme5HoeCjo; Thu, 15 Oct 2020 06:15:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5F43C882EB;
	Thu, 15 Oct 2020 06:15:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3BE92C0051;
	Thu, 15 Oct 2020 06:15:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91ED9C0051
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Oct 2020 06:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7553388089
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Oct 2020 06:15:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id av0PMyZYBU2S
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Oct 2020 06:15:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9A80988087
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Oct 2020 06:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602742549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7fm8AP60agWOcduC0GJGvPeW6g0rnJZZasC9gE26Q2w=;
 b=Im3Uytysn5I1q4Oi0RDjHphn91Myz2O2W17PnUNx3g0mMmDi6pZmgpnt2wACEYefYJXlyX
 MsHxHQoDWmUreFApEbv+HX+ymGCYjcKTCh355JGFO0IZpO4BZSPf8btd6erqclgiiqrGTv
 d2/G2xa88y+JPtcksdSQ0XFnqS0yYqw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-sG7un7QEOgKOQMoETVk6Hg-1; Thu, 15 Oct 2020 02:15:42 -0400
X-MC-Unique: sG7un7QEOgKOQMoETVk6Hg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E816803640;
 Thu, 15 Oct 2020 06:15:41 +0000 (UTC)
Received: from [10.72.13.96] (ovpn-13-96.pek2.redhat.com [10.72.13.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18919610F3;
 Thu, 15 Oct 2020 06:15:33 +0000 (UTC)
Subject: Re: [PATCH v3 2/2] vhost-vdpa: fix page pinning leakage in error path
To: si-wei liu <si-wei.liu@oracle.com>, mst@redhat.com, lingshan.zhu@intel.com
References: <1601701330-16837-1-git-send-email-si-wei.liu@oracle.com>
 <1601701330-16837-3-git-send-email-si-wei.liu@oracle.com>
 <574a64e3-8873-0639-fe32-248cb99204bc@redhat.com>
 <5F863B83.6030204@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <835e79de-52d9-1d07-71dd-d9bee6b9f62e@redhat.com>
Date: Thu, 15 Oct 2020 14:15:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5F863B83.6030204@oracle.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: netdev@vger.kernel.org, virtualization@lists.linux-foundation.org,
 boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvMTAvMTQg5LiK5Y2INzo0Miwgc2ktd2VpIGxpdSB3cm90ZToKPj4KPj4KPj4gU28g
d2hhdCBJIHN1Z2dlc3QgaXMgdG8gZml4IHRoZSBwaW5uaW5nIGxlYWthZ2UgZmlyc3QgYW5kIGRv
IHRoZSAKPj4gcG9zc2libGUgb3B0aW1pemF0aW9uIG9uIHRvcCAod2hpY2ggaXMgc3RpbGwgcXVl
c3Rpb25hYmxlIHRvIG1lKS4KPiBPSy4gVW5mb3J0dW5hdGVseSwgdGhpcyB3YXMgcGlja2VkIGFu
ZCBnb3QgbWVyZ2VkIGluIHVwc3RyZWFtLiBTbyBJIAo+IHdpbGwgcG9zdCBhIGZvbGxvdyB1cCBw
YXRjaCBzZXQgdG8gMSkgcmV2ZXJ0IHRoZSBjb21taXQgdG8gdGhlIAo+IG9yaWdpbmFsIF9fZ2V0
X2ZyZWVfcGFnZSgpIGltcGxlbWVudGF0aW9uLCBhbmQgMikgZml4IHRoZSBhY2NvdW50aW5nIAo+
IGFuZCBsZWFrYWdlIG9uIHRvcC4gV2lsbCBpdCBiZSBmaW5lPwoKCkZpbmUuCgpUaGFua3MKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
