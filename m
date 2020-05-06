Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B91421C6B59
	for <lists.virtualization@lfdr.de>; Wed,  6 May 2020 10:19:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0A9448855A;
	Wed,  6 May 2020 08:19:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W3Yee4EYGw-r; Wed,  6 May 2020 08:19:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7D0658855D;
	Wed,  6 May 2020 08:19:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5ACC4C0863;
	Wed,  6 May 2020 08:19:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC918C0859
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9919186511
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5UNEaC7Yd2Aw
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:19:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C7DD686475
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588753193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RCAnXwZiAEiMj7R4ogMQj0woVBKNACtfrYeqTg9CBXo=;
 b=blCyg+GMb2n3wHjBUdd/DvgbzBoKHV5xRs8h4+XtnJin87BSDGwSbPqlzV6UBoErwhEKlZ
 A4rXXhwx4PbtVCaaIE7rDfnfwi8SahNQ8JygNwecTYYaDGoPnjCzQ2uDQB6JPDslxZK6cl
 v6IxZGMRAw6cBI3XZu/Aowe1ScIXpo0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-9_qVx4ajOxaJgzLRs0P4VQ-1; Wed, 06 May 2020 04:19:51 -0400
X-MC-Unique: 9_qVx4ajOxaJgzLRs0P4VQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8787818FE860;
 Wed,  6 May 2020 08:19:50 +0000 (UTC)
Received: from [10.72.13.165] (ovpn-13-165.pek2.redhat.com [10.72.13.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22F8E1FBCD;
 Wed,  6 May 2020 08:19:41 +0000 (UTC)
Subject: Re: [PATCH net-next 1/2] virtio-net: don't reserve space for vnet
 header for XDP
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200506061633.16327-1-jasowang@redhat.com>
 <20200506033834-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <7a169b06-b6b9-eac1-f03a-39dd1cfcce57@redhat.com>
Date: Wed, 6 May 2020 16:19:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506033834-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 Jesper Dangaard Brouer <brouer@redhat.com>, linux-kernel@vger.kernel.org,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvNS82IOS4i+WNiDM6NTMsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBX
ZWQsIE1heSAwNiwgMjAyMCBhdCAwMjoxNjozMlBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBXZSB0cmllZCB0byByZXNlcnZlIHNwYWNlIGZvciB2bmV0IGhlYWRlciBiZWZvcmUKPj4geGRw
LmRhdGFfaGFyZF9zdGFydC4gQnV0IHRoaXMgaXMgdXNlbGVzcyBzaW5jZSB0aGUgcGFja2V0IGNv
dWxkIGJlCj4+IG1vZGlmaWVkIGJ5IFhEUCB3aGljaCBtYXkgaW52YWxpZGF0ZSB0aGUgaW5mb3Jt
YXRpb24gc3RvcmVkIGluIHRoZQo+PiBoZWFkZXIgYW5kIHRoZXJlJ3Mgbm8gd2F5IGZvciBYRFAg
dG8ga25vdyB0aGUgZXhpc3RlbmNlIG9mIHRoZSB2bmV0Cj4+IGhlYWRlciBjdXJyZW50bHkuCj4g
V2hhdCBkbyB5b3UgbWVhbj8gRG9lc24ndCBYRFBfUEFTUyB1c2UgdGhlIGhlYWRlciBpbiB0aGUg
YnVmZmVyPwoKCldlIGRvbid0LCBzZWUgNDM2Yzk0NTNhMWFjMCAoInZpcnRpby1uZXQ6IGtlZXAg
dm5ldCBoZWFkZXIgemVyb2VkIGFmdGVyIApwcm9jZXNzaW5nIFhEUCIpCgpJZiB0aGVyZSdzIG90
aGVyIHBsYWNlLCBpdCBzaG91bGQgYmUgYSBidWcuCgoKPgo+PiBTbyBsZXQncyBqdXN0IG5vdCBy
ZXNlcnZlIHNwYWNlIGZvciB2bmV0IGhlYWRlciBpbiB0aGlzIGNhc2UuCj4gSW4gYW55IGNhc2Us
IHdlIGNhbiBmaW5kIG91dCBYRFAgZG9lcyBoZWFkIGFkanVzdG1lbnRzCj4gaWYgd2UgbmVlZCB0
by4KCgpCdXQgWERQIHByb2dyYW0gY2FuIG1vZGlmeSB0aGUgcGFja2V0cyB3aXRob3V0IGFkanVz
dGluZyBoZWFkZXJzLgoKVGhhbmtzCgoKPgo+Cj4+IENjOiBKZXNwZXIgRGFuZ2FhcmQgQnJvdWVy
IDxicm91ZXJAcmVkaGF0LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFzb3dh
bmdAcmVkaGF0LmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9uZXQvdmlydGlvX25ldC5jIHwgNiAr
KystLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jIGIvZHJpdmVycy9u
ZXQvdmlydGlvX25ldC5jCj4+IGluZGV4IDExZjcyMjQ2MDUxMy4uOThkZDc1YjY2NWE1IDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL25ldC92aXJ0aW9fbmV0LmMKPj4gKysrIGIvZHJpdmVycy9uZXQv
dmlydGlvX25ldC5jCj4+IEBAIC02ODQsOCArNjg0LDggQEAgc3RhdGljIHN0cnVjdCBza19idWZm
ICpyZWNlaXZlX3NtYWxsKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYsCj4+ICAgCQkJcGFnZSA9IHhk
cF9wYWdlOwo+PiAgIAkJfQo+PiAgIAo+PiAtCQl4ZHAuZGF0YV9oYXJkX3N0YXJ0ID0gYnVmICsg
VklSVE5FVF9SWF9QQUQgKyB2aS0+aGRyX2xlbjsKPj4gLQkJeGRwLmRhdGEgPSB4ZHAuZGF0YV9o
YXJkX3N0YXJ0ICsgeGRwX2hlYWRyb29tOwo+PiArCQl4ZHAuZGF0YV9oYXJkX3N0YXJ0ID0gYnVm
ICsgVklSVE5FVF9SWF9QQUQ7Cj4+ICsJCXhkcC5kYXRhID0geGRwLmRhdGFfaGFyZF9zdGFydCAr
IHhkcF9oZWFkcm9vbSArIHZpLT5oZHJfbGVuOwo+PiAgIAkJeGRwLmRhdGFfZW5kID0geGRwLmRh
dGEgKyBsZW47Cj4+ICAgCQl4ZHAuZGF0YV9tZXRhID0geGRwLmRhdGE7Cj4+ICAgCQl4ZHAucnhx
ID0gJnJxLT54ZHBfcnhxOwo+PiBAQCAtODQ1LDcgKzg0NSw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc2tf
YnVmZiAqcmVjZWl2ZV9tZXJnZWFibGUoc3RydWN0IG5ldF9kZXZpY2UgKmRldiwKPj4gICAJCSAq
IHRoZSBkZXNjcmlwdG9yIG9uIGlmIHdlIGdldCBhbiBYRFBfVFggcmV0dXJuIGNvZGUuCj4+ICAg
CQkgKi8KPj4gICAJCWRhdGEgPSBwYWdlX2FkZHJlc3MoeGRwX3BhZ2UpICsgb2Zmc2V0Owo+PiAt
CQl4ZHAuZGF0YV9oYXJkX3N0YXJ0ID0gZGF0YSAtIFZJUlRJT19YRFBfSEVBRFJPT00gKyB2aS0+
aGRyX2xlbjsKPj4gKwkJeGRwLmRhdGFfaGFyZF9zdGFydCA9IGRhdGEgLSBWSVJUSU9fWERQX0hF
QURST09NOwo+PiAgIAkJeGRwLmRhdGEgPSBkYXRhICsgdmktPmhkcl9sZW47Cj4+ICAgCQl4ZHAu
ZGF0YV9lbmQgPSB4ZHAuZGF0YSArIChsZW4gLSB2aS0+aGRyX2xlbik7Cj4+ICAgCQl4ZHAuZGF0
YV9tZXRhID0geGRwLmRhdGE7Cj4+IC0tIAo+PiAyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApW
aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
