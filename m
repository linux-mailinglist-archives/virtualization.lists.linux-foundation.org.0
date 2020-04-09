Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D31D51A2DE6
	for <lists.virtualization@lfdr.de>; Thu,  9 Apr 2020 05:19:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 54A85203ED;
	Thu,  9 Apr 2020 03:19:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KaZUQnODC-lr; Thu,  9 Apr 2020 03:19:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 768B72038F;
	Thu,  9 Apr 2020 03:19:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57CD8C0177;
	Thu,  9 Apr 2020 03:19:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40C49C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 03:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 37DDF85F52
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 03:19:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M4ocBi2Ok55M
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 03:19:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6CBCF84EA3
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 03:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586402377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7+SzqkDXl2Jmhsnr0y9L6At5X0+bUJC/xN2Tg8J4VyY=;
 b=JYffWnFOXOV/lyATIq2a/HKSIyHAjERyCydLOPXtYVIM2EXK0/m+eu5sXGz/3Da5CEFbnA
 UtuHBoBIoV94sCbYZ0bXIZ/JP4F4CxnhPmdbh8yszy4LObguRzK/R2DRfrIr3X31nm6x5P
 Cm2bDNBYmOYvzNfwWcei1/HosZ1Uh+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-z9lXOdvvODmFYx4fo57fBg-1; Wed, 08 Apr 2020 23:19:33 -0400
X-MC-Unique: z9lXOdvvODmFYx4fo57fBg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED6EC1902EAE;
 Thu,  9 Apr 2020 03:19:28 +0000 (UTC)
Received: from [10.72.13.188] (ovpn-13-188.pek2.redhat.com [10.72.13.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53354272CB;
 Thu,  9 Apr 2020 03:19:21 +0000 (UTC)
Subject: Re: [PATCH] virtio-mmio: Delete an error message in vm_find_vqs()
To: Markus Elfring <Markus.Elfring@web.de>,
 virtualization@lists.linux-foundation.org,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <9e27bc4a-cfa1-7818-dc25-8ad308816b30@web.de>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <03b19e72-0021-dc6b-77c4-ed3c4e13d526@redhat.com>
Date: Thu, 9 Apr 2020 11:19:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <9e27bc4a-cfa1-7818-dc25-8ad308816b30@web.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Tang Bin <tangbin@cmss.chinamobile.com>
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

Ck9uIDIwMjAvNC82IOS4iuWNiDE6MTksIE1hcmt1cyBFbGZyaW5nIHdyb3RlOgo+IEZyb206IE1h
cmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4KPiBEYXRlOiBTdW4s
IDUgQXByIDIwMjAgMTk6MTQ6MTAgKzAyMDAKPgo+IFRoZSBmdW5jdGlvbiDigJxwbGF0Zm9ybV9n
ZXRfaXJx4oCdIGNhbiBsb2cgYW4gZXJyb3IgYWxyZWFkeS4KPiBUaHVzIG9taXQgYSByZWR1bmRh
bnQgbWVzc2FnZSBmb3IgdGhlIGV4Y2VwdGlvbiBoYW5kbGluZyBpbiB0aGUKPiBjYWxsaW5nIGZ1
bmN0aW9uLgoKCkl0IGxvb2tzIHRvIG1lIHRoYXQgbm90IGFsbCBlcnJvciBwYXRoIG9mIHBsYXRm
b3JtX2dldF9pcnEoKSB3ZXJlIGxvZ2dkLgoKQW5kIGdpdCBncmVwIHRvbGQgbWUgdGhlcmUncmUg
b3RoZXIgdXNlcnMgb2YgcGxhdGZvcm1fZ2V0X2lycSgpIHRoYXQgCmNoZWNrIGFuZCBsb2cgYnkg
dGhlbXNlbHZlcy4KClRoYW5rcwoKCj4KPiBUaGlzIGlzc3VlIHdhcyBkZXRlY3RlZCBieSB1c2lu
ZyB0aGUgQ29jY2luZWxsZSBzb2Z0d2FyZS4KPgo+IFNpZ25lZC1vZmYtYnk6IE1hcmt1cyBFbGZy
aW5nIDxlbGZyaW5nQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4KPiAtLS0KPiAgIGRyaXZlcnMvdmly
dGlvL3ZpcnRpb19tbWlvLmMgfCA0ICstLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92aXJ0
aW9fbW1pby5jIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX21taW8uYwo+IGluZGV4IDk3ZDU3MjVm
ZDlhMi4uOWQxNmFhZmZjYTlkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19t
bWlvLmMKPiArKysgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fbW1pby5jCj4gQEAgLTQ2NiwxMCAr
NDY2LDggQEAgc3RhdGljIGludCB2bV9maW5kX3ZxcyhzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRl
diwgdW5zaWduZWQgbnZxcywKPiAgIAlpbnQgaXJxID0gcGxhdGZvcm1fZ2V0X2lycSh2bV9kZXYt
PnBkZXYsIDApOwo+ICAgCWludCBpLCBlcnIsIHF1ZXVlX2lkeCA9IDA7Cj4KPiAtCWlmIChpcnEg
PCAwKSB7Cj4gLQkJZGV2X2VycigmdmRldi0+ZGV2LCAiQ2Fubm90IGdldCBJUlEgcmVzb3VyY2Vc
biIpOwo+ICsJaWYgKGlycSA8IDApCj4gICAJCXJldHVybiBpcnE7Cj4gLQl9Cj4KPiAgIAllcnIg
PSByZXF1ZXN0X2lycShpcnEsIHZtX2ludGVycnVwdCwgSVJRRl9TSEFSRUQsCj4gICAJCQlkZXZf
bmFtZSgmdmRldi0+ZGV2KSwgdm1fZGV2KTsKPiAtLQo+IDIuMjYuMAo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5n
IGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
