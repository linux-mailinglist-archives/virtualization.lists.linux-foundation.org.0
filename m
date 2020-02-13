Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B3815B7CF
	for <lists.virtualization@lfdr.de>; Thu, 13 Feb 2020 04:34:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8AE3E82383;
	Thu, 13 Feb 2020 03:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0QdtFQdcK347; Thu, 13 Feb 2020 03:34:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 26694821AE;
	Thu, 13 Feb 2020 03:34:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 115B4C07FE;
	Thu, 13 Feb 2020 03:34:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B6E7C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 03:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2327682383
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 03:34:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uB-i8sDOyKNw
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 03:34:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B7AEE821AE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 03:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581564872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jveoJYEei31LnYAAA1c+qGj2sc1cBfYcZJcuE3oKpzU=;
 b=IfPK6GPzSSAIyATiMStCwXT2kh68/p284zdYWH+8CY6l76AopclO/eX3YHmeKFsuvPr5Am
 q1nS3SwZVmi8pUL/4UPWNpoH7vda/MPaZzqX414W3MgrolwzBxpO1HgF+wfjKFLroU7xhX
 hrlz0pe6YcE9RPyTUi78rIy7E+dwf1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-_Su18Ee-OOmoGnyCqHCCHA-1; Wed, 12 Feb 2020 22:34:30 -0500
X-MC-Unique: _Su18Ee-OOmoGnyCqHCCHA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBD04800D41;
 Thu, 13 Feb 2020 03:34:27 +0000 (UTC)
Received: from [10.72.13.212] (ovpn-13-212.pek2.redhat.com [10.72.13.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54EF710002B6;
 Thu, 13 Feb 2020 03:34:12 +0000 (UTC)
Subject: Re: [PATCH V2 3/5] vDPA: introduce vDPA bus
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200210035608.10002-1-jasowang@redhat.com>
 <20200210035608.10002-4-jasowang@redhat.com>
 <20200211134746.GI4271@mellanox.com>
 <cf7abcc9-f8ef-1fe2-248e-9b9028788ade@redhat.com>
 <20200212125108.GS4271@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <12775659-1589-39e4-e344-b7a2c792b0f3@redhat.com>
Date: Thu, 13 Feb 2020 11:34:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200212125108.GS4271@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: kvm@vger.kernel.org, mst@redhat.com, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 lulu@redhat.com, hanand@xilinx.com, hch@infradead.org, eperezma@redhat.com,
 haotian.wang@sifive.com, shahafs@mellanox.com, parav@mellanox.com,
 jiri@mellanox.com, xiao.w.wang@intel.com, stefanha@redhat.com,
 zhihong.wang@intel.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, netdev@vger.kernel.org, lingshan.zhu@intel.com
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

Ck9uIDIwMjAvMi8xMiDkuIvljYg4OjUxLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gV2Vk
LCBGZWIgMTIsIDIwMjAgYXQgMDM6NTU6MzFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+
IFRoZSBpZGFfc2ltcGxlX3JlbW92ZSBzaG91bGQgcHJvYmFibHkgYmUgcGFydCBvZiB0aGUgY2xh
c3MgcmVsZWFzZQo+Pj4gZnVuY3Rpb24gdG8gbWFrZSBldmVyeXRoaW5nIHdvcmsgcmlnaHQKPj4g
SXQgbG9va3MgdG8gbWUgYnVzIGluc3RlYWQgb2YgY2xhc3MgaXMgdGhlIGNvcnJlY3QgYWJzdHJh
Y3Rpb24gaGVyZSBzaW5jZQo+PiB0aGUgZGV2aWNlcyBzaGFyZSBhIHNldCBvZiBwcm9ncmFtbWlu
ZyBpbnRlcmZhY2UgYnV0IG5vdCB0aGUgc2VtYW50aWNzLgo+IGRldmljZV9yZWxlYXNlKCkgZG9l
c24ndCBjYWxsIHRoZSBidXMgcmVsZWFzZT8KCgpXaGF0IGl0IGRpZCBpczoKCiDCoMKgwqDCoMKg
wqDCoCBpZiAoZGV2LT5yZWxlYXNlKQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRl
di0+cmVsZWFzZShkZXYpOwogwqDCoMKgwqDCoMKgwqAgZWxzZSBpZiAoZGV2LT50eXBlICYmIGRl
di0+dHlwZS0+cmVsZWFzZSkKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXYtPnR5
cGUtPnJlbGVhc2UoZGV2KTsKIMKgwqDCoMKgwqDCoMKgIGVsc2UgaWYgKGRldi0+Y2xhc3MgJiYg
ZGV2LT5jbGFzcy0+ZGV2X3JlbGVhc2UpCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ZGV2LT5jbGFzcy0+ZGV2X3JlbGVhc2UoZGV2KTsKIMKgwqDCoMKgwqDCoMKgIGVsc2UKIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBXQVJOKDEsIEtFUk5fRVJSICJEZXZpY2UgJyVzJyBk
b2VzIG5vdCBoYXZlIGEgcmVsZWFzZSgpIApmdW5jdGlvbiwgaXQgaXMgYnJva2VuIGFuZCBtdXN0
IGJlIGZpeGVkLiBTZWUgRG9jdW1lbnRhdGlvbi9rb2JqZWN0LnR4dC5cbiIsCiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9uYW1lKGRldikpOwoKU28g
aXQgbG9va3Mgbm90LgoKCj4gICBZb3UgaGF2ZSBkZXYsIHR5cGUgb3IKPiBjbGFzcyB0byBjaG9v
c2UgZnJvbS4gVHlwZSBpcyByYXJlbHkgdXNlZCBhbmQgZG9lc24ndCBzZWVtIHRvIGJlIHVzZWQK
PiBieSB2ZHBhLCBzbyBjbGFzcyBzZWVtcyB0aGUgcmlnaHQgY2hvaWNlCj4KPiBKYXNvbgoKClll
cywgYnV0IG15IHVuZGVyc3RhbmRpbmcgaXMgY2xhc3MgYW5kIGJ1cyBhcmUgbXV0dWFsbHkgZXhj
bHVzaXZlLiBTbyB3ZSAKY2FuJ3QgYWRkIGEgY2xhc3MgdG8gYSBkZXZpY2Ugd2hpY2ggaXMgYWxy
ZWFkeSBhdHRhY2hlZCBvbiBhIGJ1cy4KClRoYW5rcwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0
dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
