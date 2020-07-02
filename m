Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 395B1211A86
	for <lists.virtualization@lfdr.de>; Thu,  2 Jul 2020 05:06:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C89E58A6F6;
	Thu,  2 Jul 2020 03:06:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WE-RE2Ajy1+l; Thu,  2 Jul 2020 03:06:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3AE768A6B2;
	Thu,  2 Jul 2020 03:06:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F628C0733;
	Thu,  2 Jul 2020 03:06:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96A7FC0733
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 03:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8B8A98B4FC
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 03:06:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qkQ9CcLucba4
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 03:06:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 40E4A8B4F7
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 03:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593659182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qeIaIEJc94t9oaVvAhehA4A3clx6kWGL/yNP4QpP1wc=;
 b=e6JWw5rTE1iqJxysdXQgh1+9v+ajdpcwipbOkloWe0GWGUSm+S1ZAzBHXeFXuBAPxGBa8L
 88uHp7dSEQZ9ENShOoBQX0ioQXflqCiEYwXL9+2NZQUlVN16srAH2dL5/4mprjoCHZVr9d
 SKVcuWi6lLP42hGRPBJD4T38lWBx+60=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-5_ARSzpKPziJDyNbg8kvtA-1; Wed, 01 Jul 2020 23:06:18 -0400
X-MC-Unique: 5_ARSzpKPziJDyNbg8kvtA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8C5B800D5C;
 Thu,  2 Jul 2020 03:06:17 +0000 (UTC)
Received: from [10.72.13.248] (ovpn-13-248.pek2.redhat.com [10.72.13.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B237079233;
 Thu,  2 Jul 2020 03:06:12 +0000 (UTC)
Subject: Re: [PATCH 2/2] virtio-mmio: Reject invalid IRQ 0 command line
 argument
To: Bjorn Helgaas <helgaas@kernel.org>, linux-kernel@vger.kernel.org
References: <20200701221040.3667868-1-helgaas@kernel.org>
 <20200701221040.3667868-3-helgaas@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <032d0424-4876-6322-76d2-d733db28addb@redhat.com>
Date: Thu, 2 Jul 2020 11:06:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200701221040.3667868-3-helgaas@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 virtualization@lists.linux-foundation.org,
 "Michael S . Tsirkin" <mst@redhat.com>
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

Ck9uIDIwMjAvNy8yIOS4iuWNiDY6MTAsIEJqb3JuIEhlbGdhYXMgd3JvdGU6Cj4gRnJvbTogQmpv
cm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KPgo+IFRoZSAidmlydGlvX21taW8uZGV2
aWNlPSIgY29tbWFuZCBsaW5lIGFyZ3VtZW50IGFsbG93cyBhIHVzZXIgdG8gc3BlY2lmeQo+IHRo
ZSBzaXplLCBhZGRyZXNzLCBhbmQgSVJRIG9mIGEgdmlydGlvIGRldmljZS4gIFByZXZpb3VzbHkg
dGhlIG9ubHkKPiByZXF1aXJlbWVudCBmb3IgdGhlIElSUSB3YXMgdGhhdCBpdCBiZSBhbiB1bnNp
Z25lZCBpbnRlZ2VyLgo+Cj4gWmVybyBpcyBhbiB1bnNpZ25lZCBpbnRlZ2VyIGJ1dCBhbiBpbnZh
bGlkIElSUSBudW1iZXIsIGFuZCBhZnRlcgo+IGE4NWE2Yzg2YzI1YmUgKCJkcml2ZXIgY29yZTog
cGxhdGZvcm06IENsYXJpZnkgdGhhdCBJUlEgMCBpcyBpbnZhbGlkIiksCj4gYXR0ZW1wdHMgdG8g
dXNlIElSUSAwIGNhdXNlIHdhcm5pbmdzLgo+Cj4gSWYgdGhlIHVzZXIgc3BlY2lmaWVzIElSUSAw
LCByZXR1cm4gZmFpbHVyZSBpbnN0ZWFkIG9mIHJlZ2lzdGVyaW5nIGEgZGV2aWNlCj4gd2l0aCBJ
UlEgMC4KPgo+IEZpeGVzOiBhODVhNmM4NmMyNWJlICgiZHJpdmVyIGNvcmU6IHBsYXRmb3JtOiBD
bGFyaWZ5IHRoYXQgSVJRIDAgaXMgaW52YWxpZCIpCj4gU2lnbmVkLW9mZi1ieTogQmpvcm4gSGVs
Z2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KPiBDYzogTWljaGFlbCBTLiBUc2lya2luIDxtc3RA
cmVkaGF0LmNvbT4KPiBDYzogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiBDYzog
dmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKPiAtLS0KPiAgIGRyaXZl
cnMvdmlydGlvL3ZpcnRpb19tbWlvLmMgfCA0ICsrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0
aW8vdmlydGlvX21taW8uYyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19tbWlvLmMKPiBpbmRleCA5
ZDE2YWFmZmNhOWQuLjYyN2FjMDQ4NzQ5NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpcnRpby92
aXJ0aW9fbW1pby5jCj4gKysrIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX21taW8uYwo+IEBAIC02
NDEsMTEgKzY0MSwxMSBAQCBzdGF0aWMgaW50IHZtX2NtZGxpbmVfc2V0KGNvbnN0IGNoYXIgKmRl
dmljZSwKPiAgIAkJCSZ2bV9jbWRsaW5lX2lkLCAmY29uc3VtZWQpOwo+ICAgCj4gICAJLyoKPiAt
CSAqIHNzY2FuZigpIG11c3QgcHJvY2Vzc2VzIGF0IGxlYXN0IDIgY2h1bmtzOyBhbHNvIHRoZXJl
Cj4gKwkgKiBzc2NhbmYoKSBtdXN0IHByb2Nlc3MgYXQgbGVhc3QgMiBjaHVua3M7IGFsc28gdGhl
cmUKPiAgIAkgKiBtdXN0IGJlIG5vIGV4dHJhIGNoYXJhY3RlcnMgYWZ0ZXIgdGhlIGxhc3QgY2h1
bmssIHNvCj4gICAJICogc3RyW2NvbnN1bWVkXSBtdXN0IGJlICdcMCcKPiAgIAkgKi8KPiAtCWlm
IChwcm9jZXNzZWQgPCAyIHx8IHN0cltjb25zdW1lZF0pCj4gKwlpZiAocHJvY2Vzc2VkIDwgMiB8
fCBzdHJbY29uc3VtZWRdIHx8IGlycSA9PSAwKQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgIAo+
ICAgCXJlc291cmNlc1swXS5mbGFncyA9IElPUkVTT1VSQ0VfTUVNOwoKCkFja2VkLWJ5OiBKYXNv
biBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
