Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 352B054E0B4
	for <lists.virtualization@lfdr.de>; Thu, 16 Jun 2022 14:21:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36E3C403AA;
	Thu, 16 Jun 2022 12:21:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22FjCfdvfUii; Thu, 16 Jun 2022 12:21:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A75DE405A7;
	Thu, 16 Jun 2022 12:21:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 257ACC002D;
	Thu, 16 Jun 2022 12:21:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED67CC002D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jun 2022 12:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE2C860E4D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jun 2022 12:21:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rKE3lwjo3FVI
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jun 2022 12:21:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4D3360670
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jun 2022 12:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655382092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tKO9kaIoz02UsmIAowV9+PkxCUTdW7CkFsqbsOOxG00=;
 b=WDua1ee5npb8//JdC6RZckGEj36+ROsvMsTzfbq32p0mgAvpWitVt1aWfx8WrosVUb9MYZ
 PTnDAFacpZRpEi5UUAjm2M+9WWUqAz3kvXg5YRRNKr0Yj7SOFYtZ0zOGHRB93WqANIt2Ru
 I093neYTbsxsC4DBZKZlLOBT/iA+DfU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-wWfnFT6kN5SRTF6T5a8fig-1; Thu, 16 Jun 2022 08:21:31 -0400
X-MC-Unique: wWfnFT6kN5SRTF6T5a8fig-1
Received: by mail-wm1-f70.google.com with SMTP id
 c185-20020a1c35c2000000b0039db3e56c39so1070502wma.5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jun 2022 05:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tKO9kaIoz02UsmIAowV9+PkxCUTdW7CkFsqbsOOxG00=;
 b=otyyJ2SIKqPm9QfguqMREUzY0u42SYipJz+2EIoZDsm+RbiIj3df8i3q+2qJBKAy43
 wj33yZefsmsuay7smBvDBOLLvC2s/GPAO53FjFZ+CUB1QUA9uWYKhia/K1CkpTY+1jwW
 5LLmmGoDf3NH3JrKHpgDasTfsqhLP6JtnZV7AiQJ/+851nEj354rQCle4DMX8Wez9IP/
 Yb2xeZa8utGOaY1pY+B9E60ogCcRkg92YRbhLopmetTIJrykT3de+Ifri9krTYdkqD3Y
 wUXXZiZan1uAsTZaBiavU6UW+AI/ftcYiYO24+taPqLxM2in1ClIdz8r9b+lDhP272UG
 FomA==
X-Gm-Message-State: AJIora/42ltvFZlPlZXA/crhkku2d0TF44RcuyPwvbNwGqTn3Batgh3i
 OH+AIt93h8mTuVrFKmHQ0IJkMg6k+Aq5Jt1xPVUMaKFfd9JA9UnZEUSkRclxqSHQafEoh7bwX2X
 96YNg/4NiL3WaQ2hJIM91x0o/qe79Gx2A5TLd1rB4nQ==
X-Received: by 2002:a1c:7913:0:b0:39e:72d1:b9b3 with SMTP id
 l19-20020a1c7913000000b0039e72d1b9b3mr3521243wme.53.1655382090138; 
 Thu, 16 Jun 2022 05:21:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vImx8v+Pi0fb3eNoM8UymMi4MsjJuA+BPHWsFLmXTWOlrUWS17EyMKP0suss+nPlbqnZ3UlQ==
X-Received: by 2002:a1c:7913:0:b0:39e:72d1:b9b3 with SMTP id
 l19-20020a1c7913000000b0039e72d1b9b3mr3521223wme.53.1655382089862; 
 Thu, 16 Jun 2022 05:21:29 -0700 (PDT)
Received: from redhat.com ([2a03:c5c0:107d:d500:e9ae:3150:6c35:ac38])
 by smtp.gmail.com with ESMTPSA id
 i2-20020adffdc2000000b00213ba4b5d94sm2135823wrs.27.2022.06.16.05.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 05:21:29 -0700 (PDT)
Date: Thu, 16 Jun 2022 08:21:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Albert Huang <huangjie.albert@bytedance.com>
Subject: Re: [PATCH v3] virtio_ring : keep used_wrap_counter in
 vq->last_used_idx
Message-ID: <20220616081812-mutt-send-email-mst@kernel.org>
References: <20220616024148-mutt-send-email-mst@kernel.org>
 <20220616095500.41239-1-huangjie.albert@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20220616095500.41239-1-huangjie.albert@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org, yuanzhu@bytedance.com,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gVGh1LCBKdW4gMTYsIDIwMjIgYXQgMDU6NTQ6NTlQTSArMDgwMCwgQWxiZXJ0IEh1YW5nIHdy
b3RlOgo+IEZyb206ICJodWFuZ2ppZS5hbGJlcnQiIDxodWFuZ2ppZS5hbGJlcnRAYnl0ZWRhbmNl
LmNvbT4KPiAKPiB0aGUgdXNlZF93cmFwX2NvdW50ZXIgYW5kIHRoZSB2cS0+bGFzdF91c2VkX2lk
eCBtYXkgZ2V0Cj4gb3V0IG9mIHN5bmMgaWYgdGhleSBhcmUgc2VwYXJhdGUgYXNzaWdubWVudO+8
jGFuZCBpbnRlcnJ1cHQKPiBtaWdodCB1c2UgYW4gaW5jb3JyZWN0IHZhbHVlIHRvIGNoZWNrIGZv
ciB0aGUgdXNlZCBpbmRleC4KPiAKPiBmb3IgZXhhbXBsZTpPT0IgYWNjZXNzCj4ga3NvZnRpcnFk
IG1heSBjb25zdW1lIHRoZSBwYWNrZXQgYW5kIGl0IHdpbGwgY2FsbDoKPiB2aXJ0bmV0X3BvbGwK
PiAJLS0+dmlydG5ldF9yZWNlaXZlCj4gCQktLT52aXJ0cXVldWVfZ2V0X2J1Zl9jdHgKPiAJCQkt
LT52aXJ0cXVldWVfZ2V0X2J1Zl9jdHhfcGFja2VkCj4gYW5kIGluIHZpcnRxdWV1ZV9nZXRfYnVm
X2N0eF9wYWNrZWQ6Cj4gCj4gdnEtPmxhc3RfdXNlZF9pZHggKz0gdnEtPnBhY2tlZC5kZXNjX3N0
YXRlW2lkXS5udW07Cj4gaWYgKHVubGlrZWx5KHZxLT5sYXN0X3VzZWRfaWR4ID49IHZxLT5wYWNr
ZWQudnJpbmcubnVtKSkgewo+ICAgICAgICAgIHZxLT5sYXN0X3VzZWRfaWR4IC09IHZxLT5wYWNr
ZWQudnJpbmcubnVtOwo+ICAgICAgICAgIHZxLT5wYWNrZWQudXNlZF93cmFwX2NvdW50ZXIgXj0g
MTsKPiB9Cj4gCj4gaWYgYXQgdGhlIHNhbWUgdGltZSwgdGhlcmUgY29tZXMgYSB2cmluZyBpbnRl
cnJ1cHTvvIxpbiB2cmluZ19pbnRlcnJ1cHQ6Cj4gd2Ugd2lsbCBjYWxsOgo+IHZyaW5nX2ludGVy
cnVwdAo+IAktLT5tb3JlX3VzZWQKPiAJCS0tPm1vcmVfdXNlZF9wYWNrZWQKPiAJCQktLT5pc191
c2VkX2Rlc2NfcGFja2VkCj4gaW4gaXNfdXNlZF9kZXNjX3BhY2tlZCwgdGhlIGxhc3RfdXNlZF9p
ZHggbWF5YmUgPj0gdnEtPnBhY2tlZC52cmluZy5udW0uCj4gc28gdGhpcyBjb3VsZCBjYXNlIGEg
bWVtb3J5IG91dCBvZiBib3VuZHMgYnVnLgo+IAo+IHRoaXMgcGF0Y2ggaXMgdG8ga2VlcCB0aGUg
dXNlZF93cmFwX2NvdW50ZXIgaW4gdnEtPmxhc3RfdXNlZF9pZHgKPiBzbyB3ZSBjYW4gZ2V0IHRo
ZSBjb3JyZWN0IHZhbHVlIHRvIGNoZWNrIGZvciB1c2VkIGluZGV4IGluIGludGVycnVwdC4KPiAK
PiB2Mi0+djM6Cj4gLSBhZGQgaW5saW5lIGZ1bmN0aW9uIHRvIGdldCB1c2VkX3dyYXBfY291bnRl
ciBhbmQgbGFzdF91c2VkCj4gLSB3aGVuIHVzZSB2cS0+bGFzdF91c2VkX2lkeCwgb25seSByZWFk
IG9uY2UKPiAgIGlmIHZxLT5sYXN0X3VzZWRfaWR4IGlzIHJlYWQgdHdpY2UsIHRoZSB2YWx1ZXMg
Y2FuIGJlIGluY29uc2lzdGVudC4KPiAtIHVzZSBsYXN0X3VzZWRfaWR4ICYgfigtKDEgPDwgVlJJ
TkdfUEFDS0VEX0VWRU5UX0ZfV1JBUF9DVFIpKQo+ICAgdG8gZ2V0IHRoZSBhbGwgYml0cyBiZWxv
dyBWUklOR19QQUNLRURfRVZFTlRfRl9XUkFQX0NUUgo+IAo+IHYxLT52MjoKPiAtIHJldXNlIHRo
ZSBWUklOR19QQUNLRURfRVZFTlRfRl9XUkFQX0NUUgo+IC0gUmVtb3ZlIHBhcmFtZXRlciBqdWRn
bWVudCBpbiBpc191c2VkX2Rlc2NfcGFja2VkLAo+IGJlY2F1c2UgaXQgY2FuJ3QgYmUgaWxsZWdh
bAo+IAo+IFNpZ25lZC1vZmYtYnk6IGh1YW5namllLmFsYmVydCA8aHVhbmdqaWUuYWxiZXJ0QGJ5
dGVkYW5jZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMgfCA3NSAr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQ3
IGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3ZpcnRpby92aXJ0aW9fcmluZy5jIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYwo+IGlu
ZGV4IDEzYTczNDhjZWRmZi4uYTI1M2Y1MGI4Zjg2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmly
dGlvL3ZpcnRpb19yaW5nLmMKPiArKysgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jCj4g
QEAgLTExMSw3ICsxMTEsMTIgQEAgc3RydWN0IHZyaW5nX3ZpcnRxdWV1ZSB7Cj4gIAkvKiBOdW1i
ZXIgd2UndmUgYWRkZWQgc2luY2UgbGFzdCBzeW5jLiAqLwo+ICAJdW5zaWduZWQgaW50IG51bV9h
ZGRlZDsKPiAgCj4gLQkvKiBMYXN0IHVzZWQgaW5kZXggd2UndmUgc2Vlbi4gKi8KPiArCS8qIExh
c3QgdXNlZCBpbmRleCAgd2UndmUgc2Vlbi4KPiArCSAqIGZvciBzcGxpdCByaW5nLCBpdCBqdXN0
IGNvbnRhaW5zIGxhc3QgdXNlZCBpbmRleAo+ICsJICogZm9yIHBhY2tlZCByaW5nLCBpdCBub3Qg
b25seSBjb250YWlucyBsYXN0IHVzZWQgaW5kZXgsIGJ1dCBhbHNvCj4gKwkgKiB1c2VkX3dyYXBf
Y291bnRlciwgdGhlIFZSSU5HX1BBQ0tFRF9FVkVOVF9GX1dSQVBfQ1RSIGlzCj4gKwkgKiB0aGUg
Yml0IHNoaWZ0IGluIGxhc3RfdXNlZF9pZHgKCgpyZXdvcmQ6Cgpmb3IgcGFja2VkIHJpbmcsIGJp
dHMgdXAgdG8gVlJJTkdfUEFDS0VEX0VWRU5UX0ZfV1JBUF9DVFIgaW5jbHVkZSB0aGUKbGFzdCB1
c2VkIGluZGV4LiBCaXRzIGZyb20gVlJJTkdfUEFDS0VEX0VWRU5UX0ZfV1JBUF9DVFIgaW5jbHVk
ZSB0aGUKdXNlZCB3cmFwIGNvdW50ZXIuCgo+ICsJICovCj4gIAl1MTYgbGFzdF91c2VkX2lkeDsK
PiAgCj4gIAkvKiBIaW50IGZvciBldmVudCBpZHg6IGFscmVhZHkgdHJpZ2dlcmVkIG5vIG5lZWQg
dG8gZGlzYWJsZS4gKi8KPiBAQCAtMTU0LDkgKzE1OSw2IEBAIHN0cnVjdCB2cmluZ192aXJ0cXVl
dWUgewo+ICAJCQkvKiBEcml2ZXIgcmluZyB3cmFwIGNvdW50ZXIuICovCj4gIAkJCWJvb2wgYXZh
aWxfd3JhcF9jb3VudGVyOwo+ICAKPiAtCQkJLyogRGV2aWNlIHJpbmcgd3JhcCBjb3VudGVyLiAq
Lwo+IC0JCQlib29sIHVzZWRfd3JhcF9jb3VudGVyOwo+IC0KPiAgCQkJLyogQXZhaWwgdXNlZCBm
bGFncy4gKi8KPiAgCQkJdTE2IGF2YWlsX3VzZWRfZmxhZ3M7Cj4gIAo+IEBAIC05NzMsNiArOTc1
LDE1IEBAIHN0YXRpYyBzdHJ1Y3QgdmlydHF1ZXVlICp2cmluZ19jcmVhdGVfdmlydHF1ZXVlX3Nw
bGl0KAo+ICAvKgo+ICAgKiBQYWNrZWQgcmluZyBzcGVjaWZpYyBmdW5jdGlvbnMgLSAqX3BhY2tl
ZCgpLgo+ICAgKi8KPiArc3RhdGljIGlubGluZSBib29sIHBhY2tlZF91c2VkX3dyYXBfY291bnRl
cih1MTYgbGFzdF91c2VkX2lkeCkKPiArewo+ICsJcmV0dXJuICEhKGxhc3RfdXNlZF9pZHggJiAo
MSA8PCBWUklOR19QQUNLRURfRVZFTlRfRl9XUkFQX0NUUikpOwo+ICt9Cj4gKwo+ICtzdGF0aWMg
aW5saW5lIHUxNiBwYWNrZWRfbGFzdF91c2VkKHUxNiBsYXN0X3VzZWRfaWR4KQo+ICt7Cj4gKwly
ZXR1cm4gbGFzdF91c2VkX2lkeCAmIH4oLSgxIDw8IFZSSU5HX1BBQ0tFRF9FVkVOVF9GX1dSQVBf
Q1RSKSk7Cj4gK30KPiAgCj4gIHN0YXRpYyB2b2lkIHZyaW5nX3VubWFwX2V4dHJhX3BhY2tlZChj
b25zdCBzdHJ1Y3QgdnJpbmdfdmlydHF1ZXVlICp2cSwKPiAgCQkJCSAgICAgc3RydWN0IHZyaW5n
X2Rlc2NfZXh0cmEgKmV4dHJhKQo+IEBAIC0xNDA2LDggKzE0MTcsMTQgQEAgc3RhdGljIGlubGlu
ZSBib29sIGlzX3VzZWRfZGVzY19wYWNrZWQoY29uc3Qgc3RydWN0IHZyaW5nX3ZpcnRxdWV1ZSAq
dnEsCj4gIAo+ICBzdGF0aWMgaW5saW5lIGJvb2wgbW9yZV91c2VkX3BhY2tlZChjb25zdCBzdHJ1
Y3QgdnJpbmdfdmlydHF1ZXVlICp2cSkKPiAgewo+IC0JcmV0dXJuIGlzX3VzZWRfZGVzY19wYWNr
ZWQodnEsIHZxLT5sYXN0X3VzZWRfaWR4LAo+IC0JCQl2cS0+cGFja2VkLnVzZWRfd3JhcF9jb3Vu
dGVyKTsKPiArCXUxNiBsYXN0X3VzZWQ7Cj4gKwl1MTYgbGFzdF91c2VkX2lkeDsKPiArCWJvb2wg
dXNlZF93cmFwX2NvdW50ZXI7Cj4gKwo+ICsJbGFzdF91c2VkX2lkeCA9IHZxLT5sYXN0X3VzZWRf
aWR4Owo+ICsJbGFzdF91c2VkID0gcGFja2VkX2xhc3RfdXNlZChsYXN0X3VzZWRfaWR4KTsKPiAr
CXVzZWRfd3JhcF9jb3VudGVyID0gcGFja2VkX3VzZWRfd3JhcF9jb3VudGVyKGxhc3RfdXNlZF9p
ZHgpOwo+ICsJcmV0dXJuIGlzX3VzZWRfZGVzY19wYWNrZWQodnEsIGxhc3RfdXNlZCwgdXNlZF93
cmFwX2NvdW50ZXIpOwo+ICB9Cj4gIAo+ICBzdGF0aWMgdm9pZCAqdmlydHF1ZXVlX2dldF9idWZf
Y3R4X3BhY2tlZChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEsCj4gQEAgLTE0MTUsNyArMTQzMiw4IEBA
IHN0YXRpYyB2b2lkICp2aXJ0cXVldWVfZ2V0X2J1Zl9jdHhfcGFja2VkKHN0cnVjdCB2aXJ0cXVl
dWUgKl92cSwKPiAgCQkJCQkgIHZvaWQgKipjdHgpCj4gIHsKPiAgCXN0cnVjdCB2cmluZ192aXJ0
cXVldWUgKnZxID0gdG9fdnZxKF92cSk7Cj4gLQl1MTYgbGFzdF91c2VkLCBpZDsKPiArCXUxNiBs
YXN0X3VzZWQsIGlkLCBsYXN0X3VzZWRfaWR4Owo+ICsJYm9vbCB1c2VkX3dyYXBfY291bnRlcjsK
PiAgCXZvaWQgKnJldDsKPiAgCj4gIAlTVEFSVF9VU0UodnEpOwo+IEBAIC0xNDM0LDcgKzE0NTIs
OSBAQCBzdGF0aWMgdm9pZCAqdmlydHF1ZXVlX2dldF9idWZfY3R4X3BhY2tlZChzdHJ1Y3Qgdmly
dHF1ZXVlICpfdnEsCj4gIAkvKiBPbmx5IGdldCB1c2VkIGVsZW1lbnRzIGFmdGVyIHRoZXkgaGF2
ZSBiZWVuIGV4cG9zZWQgYnkgaG9zdC4gKi8KPiAgCXZpcnRpb19ybWIodnEtPndlYWtfYmFycmll
cnMpOwo+ICAKPiAtCWxhc3RfdXNlZCA9IHZxLT5sYXN0X3VzZWRfaWR4Owo+ICsJbGFzdF91c2Vk
X2lkeCA9IHZxLT5sYXN0X3VzZWRfaWR4OwoKCkkgdGhpbmsgd2UgbmVlZCBSRUFEX09OQ0UgaGVy
ZS4gT3RoZXJ3aXNlIGNvbXBpbGVyIGlzIGZyZWUgdG8gc3RpbGwKZG8gdHdvIHJlYWRzLgoKPiAr
CXVzZWRfd3JhcF9jb3VudGVyID0gcGFja2VkX3VzZWRfd3JhcF9jb3VudGVyKGxhc3RfdXNlZF9p
ZHgpOwo+ICsJbGFzdF91c2VkID0gcGFja2VkX2xhc3RfdXNlZChsYXN0X3VzZWRfaWR4KTsKPiAg
CWlkID0gbGUxNl90b19jcHUodnEtPnBhY2tlZC52cmluZy5kZXNjW2xhc3RfdXNlZF0uaWQpOwo+
ICAJKmxlbiA9IGxlMzJfdG9fY3B1KHZxLT5wYWNrZWQudnJpbmcuZGVzY1tsYXN0X3VzZWRdLmxl
bik7Cj4gIAo+IEBAIC0xNDUxLDEyICsxNDcxLDE1IEBAIHN0YXRpYyB2b2lkICp2aXJ0cXVldWVf
Z2V0X2J1Zl9jdHhfcGFja2VkKHN0cnVjdCB2aXJ0cXVldWUgKl92cSwKPiAgCXJldCA9IHZxLT5w
YWNrZWQuZGVzY19zdGF0ZVtpZF0uZGF0YTsKPiAgCWRldGFjaF9idWZfcGFja2VkKHZxLCBpZCwg
Y3R4KTsKPiAgCj4gLQl2cS0+bGFzdF91c2VkX2lkeCArPSB2cS0+cGFja2VkLmRlc2Nfc3RhdGVb
aWRdLm51bTsKPiAtCWlmICh1bmxpa2VseSh2cS0+bGFzdF91c2VkX2lkeCA+PSB2cS0+cGFja2Vk
LnZyaW5nLm51bSkpIHsKPiAtCQl2cS0+bGFzdF91c2VkX2lkeCAtPSB2cS0+cGFja2VkLnZyaW5n
Lm51bTsKPiAtCQl2cS0+cGFja2VkLnVzZWRfd3JhcF9jb3VudGVyIF49IDE7Cj4gKwlsYXN0X3Vz
ZWQgKz0gdnEtPnBhY2tlZC5kZXNjX3N0YXRlW2lkXS5udW07Cj4gKwlpZiAodW5saWtlbHkobGFz
dF91c2VkID49IHZxLT5wYWNrZWQudnJpbmcubnVtKSkgewo+ICsJCWxhc3RfdXNlZCAtPSB2cS0+
cGFja2VkLnZyaW5nLm51bTsKPiArCQl1c2VkX3dyYXBfY291bnRlciBePSAxOwo+ICAJfQo+ICAK
PiArCWxhc3RfdXNlZCA9IChsYXN0X3VzZWQgfCAodXNlZF93cmFwX2NvdW50ZXIgPDwgVlJJTkdf
UEFDS0VEX0VWRU5UX0ZfV1JBUF9DVFIpKTsKPiArCXZxLT5sYXN0X3VzZWRfaWR4ID0gbGFzdF91
c2VkOwo+ICsKPiAgCS8qCj4gIAkgKiBJZiB3ZSBleHBlY3QgYW4gaW50ZXJydXB0IGZvciB0aGUg
bmV4dCBlbnRyeSwgdGVsbCBob3N0Cj4gIAkgKiBieSB3cml0aW5nIGV2ZW50IGluZGV4IGFuZCBm
bHVzaCBvdXQgdGhlIHdyaXRlIGJlZm9yZQo+IEBAIC0xNDY1LDkgKzE0ODgsNyBAQCBzdGF0aWMg
dm9pZCAqdmlydHF1ZXVlX2dldF9idWZfY3R4X3BhY2tlZChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEs
Cj4gIAlpZiAodnEtPnBhY2tlZC5ldmVudF9mbGFnc19zaGFkb3cgPT0gVlJJTkdfUEFDS0VEX0VW
RU5UX0ZMQUdfREVTQykKPiAgCQl2aXJ0aW9fc3RvcmVfbWIodnEtPndlYWtfYmFycmllcnMsCj4g
IAkJCQkmdnEtPnBhY2tlZC52cmluZy5kcml2ZXItPm9mZl93cmFwLAo+IC0JCQkJY3B1X3RvX2xl
MTYodnEtPmxhc3RfdXNlZF9pZHggfAo+IC0JCQkJCSh2cS0+cGFja2VkLnVzZWRfd3JhcF9jb3Vu
dGVyIDw8Cj4gLQkJCQkJIFZSSU5HX1BBQ0tFRF9FVkVOVF9GX1dSQVBfQ1RSKSkpOwo+ICsJCQkJ
Y3B1X3RvX2xlMTYodnEtPmxhc3RfdXNlZF9pZHgpKTsKPiAgCj4gIAlMQVNUX0FERF9USU1FX0lO
VkFMSUQodnEpOwo+ICAKPiBAQCAtMTQ5OSw5ICsxNTIwLDcgQEAgc3RhdGljIHVuc2lnbmVkIGlu
dCB2aXJ0cXVldWVfZW5hYmxlX2NiX3ByZXBhcmVfcGFja2VkKHN0cnVjdCB2aXJ0cXVldWUgKl92
cSkKPiAgCj4gIAlpZiAodnEtPmV2ZW50KSB7Cj4gIAkJdnEtPnBhY2tlZC52cmluZy5kcml2ZXIt
Pm9mZl93cmFwID0KPiAtCQkJY3B1X3RvX2xlMTYodnEtPmxhc3RfdXNlZF9pZHggfAo+IC0JCQkJ
KHZxLT5wYWNrZWQudXNlZF93cmFwX2NvdW50ZXIgPDwKPiAtCQkJCSBWUklOR19QQUNLRURfRVZF
TlRfRl9XUkFQX0NUUikpOwo+ICsJCQljcHVfdG9fbGUxNih2cS0+bGFzdF91c2VkX2lkeCk7Cj4g
IAkJLyoKPiAgCQkgKiBXZSBuZWVkIHRvIHVwZGF0ZSBldmVudCBvZmZzZXQgYW5kIGV2ZW50IHdy
YXAKPiAgCQkgKiBjb3VudGVyIGZpcnN0IGJlZm9yZSB1cGRhdGluZyBldmVudCBmbGFncy4KPiBA
QCAtMTUxOCw4ICsxNTM3LDcgQEAgc3RhdGljIHVuc2lnbmVkIGludCB2aXJ0cXVldWVfZW5hYmxl
X2NiX3ByZXBhcmVfcGFja2VkKHN0cnVjdCB2aXJ0cXVldWUgKl92cSkKPiAgCX0KPiAgCj4gIAlF
TkRfVVNFKHZxKTsKPiAtCXJldHVybiB2cS0+bGFzdF91c2VkX2lkeCB8ICgodTE2KXZxLT5wYWNr
ZWQudXNlZF93cmFwX2NvdW50ZXIgPDwKPiAtCQkJVlJJTkdfUEFDS0VEX0VWRU5UX0ZfV1JBUF9D
VFIpOwo+ICsJcmV0dXJuIHZxLT5sYXN0X3VzZWRfaWR4Owo+ICB9Cj4gIAo+ICBzdGF0aWMgYm9v
bCB2aXJ0cXVldWVfcG9sbF9wYWNrZWQoc3RydWN0IHZpcnRxdWV1ZSAqX3ZxLCB1MTYgb2ZmX3dy
YXApCj4gQEAgLTE1MzcsNyArMTU1NSw3IEBAIHN0YXRpYyBib29sIHZpcnRxdWV1ZV9wb2xsX3Bh
Y2tlZChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEsIHUxNiBvZmZfd3JhcCkKPiAgc3RhdGljIGJvb2wg
dmlydHF1ZXVlX2VuYWJsZV9jYl9kZWxheWVkX3BhY2tlZChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEp
Cj4gIHsKPiAgCXN0cnVjdCB2cmluZ192aXJ0cXVldWUgKnZxID0gdG9fdnZxKF92cSk7Cj4gLQl1
MTYgdXNlZF9pZHgsIHdyYXBfY291bnRlcjsKPiArCXUxNiB1c2VkX2lkeCwgd3JhcF9jb3VudGVy
LCBsYXN0X3VzZWRfaWR4Owo+ICAJdTE2IGJ1ZnM7Cj4gIAo+ICAJU1RBUlRfVVNFKHZxKTsKPiBA
QCAtMTU1MCw5ICsxNTY4LDEwIEBAIHN0YXRpYyBib29sIHZpcnRxdWV1ZV9lbmFibGVfY2JfZGVs
YXllZF9wYWNrZWQoc3RydWN0IHZpcnRxdWV1ZSAqX3ZxKQo+ICAJaWYgKHZxLT5ldmVudCkgewo+
ICAJCS8qIFRPRE86IHR1bmUgdGhpcyB0aHJlc2hvbGQgKi8KPiAgCQlidWZzID0gKHZxLT5wYWNr
ZWQudnJpbmcubnVtIC0gdnEtPnZxLm51bV9mcmVlKSAqIDMgLyA0Owo+IC0JCXdyYXBfY291bnRl
ciA9IHZxLT5wYWNrZWQudXNlZF93cmFwX2NvdW50ZXI7Cj4gKwkJbGFzdF91c2VkX2lkeCA9IHZx
LT5sYXN0X3VzZWRfaWR4Owo+ICsJCXdyYXBfY291bnRlciA9IHBhY2tlZF91c2VkX3dyYXBfY291
bnRlcihsYXN0X3VzZWRfaWR4KTsKPiAgCj4gLQkJdXNlZF9pZHggPSB2cS0+bGFzdF91c2VkX2lk
eCArIGJ1ZnM7Cj4gKwkJdXNlZF9pZHggPSBwYWNrZWRfbGFzdF91c2VkKGxhc3RfdXNlZF9pZHgp
ICsgYnVmczsKPiAgCQlpZiAodXNlZF9pZHggPj0gdnEtPnBhY2tlZC52cmluZy5udW0pIHsKPiAg
CQkJdXNlZF9pZHggLT0gdnEtPnBhY2tlZC52cmluZy5udW07Cj4gIAkJCXdyYXBfY291bnRlciBe
PSAxOwo+IEBAIC0xNTgyLDkgKzE2MDEsMTAgQEAgc3RhdGljIGJvb2wgdmlydHF1ZXVlX2VuYWJs
ZV9jYl9kZWxheWVkX3BhY2tlZChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEpCj4gIAkgKi8KPiAgCXZp
cnRpb19tYih2cS0+d2Vha19iYXJyaWVycyk7Cj4gIAo+IC0JaWYgKGlzX3VzZWRfZGVzY19wYWNr
ZWQodnEsCj4gLQkJCQl2cS0+bGFzdF91c2VkX2lkeCwKPiAtCQkJCXZxLT5wYWNrZWQudXNlZF93
cmFwX2NvdW50ZXIpKSB7Cj4gKwlsYXN0X3VzZWRfaWR4ID0gdnEtPmxhc3RfdXNlZF9pZHg7CgoK
c2FtZSBoZXJlLgoKPiArCXdyYXBfY291bnRlciA9IHBhY2tlZF91c2VkX3dyYXBfY291bnRlcihs
YXN0X3VzZWRfaWR4KTsKPiArCXVzZWRfaWR4ID0gcGFja2VkX2xhc3RfdXNlZChsYXN0X3VzZWRf
aWR4KTsKPiArCWlmIChpc191c2VkX2Rlc2NfcGFja2VkKHZxLCB1c2VkX2lkeCwgd3JhcF9jb3Vu
dGVyKSkgewo+ICAJCUVORF9VU0UodnEpOwo+ICAJCXJldHVybiBmYWxzZTsKPiAgCX0KPiBAQCAt
MTY4OSw3ICsxNzA5LDcgQEAgc3RhdGljIHN0cnVjdCB2aXJ0cXVldWUgKnZyaW5nX2NyZWF0ZV92
aXJ0cXVldWVfcGFja2VkKAo+ICAJdnEtPm5vdGlmeSA9IG5vdGlmeTsKPiAgCXZxLT53ZWFrX2Jh
cnJpZXJzID0gd2Vha19iYXJyaWVyczsKPiAgCXZxLT5icm9rZW4gPSB0cnVlOwo+IC0JdnEtPmxh
c3RfdXNlZF9pZHggPSAwOwo+ICsJdnEtPmxhc3RfdXNlZF9pZHggPSAwIHwgKDEgPDwgVlJJTkdf
UEFDS0VEX0VWRU5UX0ZfV1JBUF9DVFIpOwo+ICAJdnEtPmV2ZW50X3RyaWdnZXJlZCA9IGZhbHNl
Owo+ICAJdnEtPm51bV9hZGRlZCA9IDA7Cj4gIAl2cS0+cGFja2VkX3JpbmcgPSB0cnVlOwo+IEBA
IC0xNzIwLDcgKzE3NDAsNiBAQCBzdGF0aWMgc3RydWN0IHZpcnRxdWV1ZSAqdnJpbmdfY3JlYXRl
X3ZpcnRxdWV1ZV9wYWNrZWQoCj4gIAo+ICAJdnEtPnBhY2tlZC5uZXh0X2F2YWlsX2lkeCA9IDA7
Cj4gIAl2cS0+cGFja2VkLmF2YWlsX3dyYXBfY291bnRlciA9IDE7Cj4gLQl2cS0+cGFja2VkLnVz
ZWRfd3JhcF9jb3VudGVyID0gMTsKPiAgCXZxLT5wYWNrZWQuZXZlbnRfZmxhZ3Nfc2hhZG93ID0g
MDsKPiAgCXZxLT5wYWNrZWQuYXZhaWxfdXNlZF9mbGFncyA9IDEgPDwgVlJJTkdfUEFDS0VEX0RF
U0NfRl9BVkFJTDsKPiAgCj4gLS0gCj4gMi4zMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
