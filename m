Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A715544BA
	for <lists.virtualization@lfdr.de>; Wed, 22 Jun 2022 10:51:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DCB484692;
	Wed, 22 Jun 2022 08:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DCB484692
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f1JNrogk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i0_f-4phitXp; Wed, 22 Jun 2022 08:51:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3E0D884686;
	Wed, 22 Jun 2022 08:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E0D884686
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 701E3C0081;
	Wed, 22 Jun 2022 08:51:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B33D0C002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jun 2022 08:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D3388188B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jun 2022 08:51:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D3388188B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XQFmzcGVvrZ3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jun 2022 08:51:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9D3584692
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9D3584692
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jun 2022 08:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655887897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gkltbLrGQ8mmDgYD5JYBmWsZ6WjkvgUqrGhlmxetZB4=;
 b=f1JNrogk6tgABZn69tJT3RU4VQbviaToRrOVjen6jFviXRuH3EeTM4QBrrI6h6fGS5jQRE
 DJXpuu4svk6PGMtmQtzm5EnEU3mETnByANE/SR+wsPgorswVt4vg8sDvOUAUkMKsH4caa2
 4UZzVT/kEnOvNZ1Yy2b85YK5869qXr0=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-__rFvEbGOnGEyvqRu9Tsfw-1; Wed, 22 Jun 2022 04:51:36 -0400
X-MC-Unique: __rFvEbGOnGEyvqRu9Tsfw-1
Received: by mail-lf1-f72.google.com with SMTP id
 c5-20020a056512238500b0047954b68297so8189519lfv.3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jun 2022 01:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gkltbLrGQ8mmDgYD5JYBmWsZ6WjkvgUqrGhlmxetZB4=;
 b=LeyJwlIm4DdYh/DVTctsH40ZJ988ogUKPsnaaGl+wsS/ScNptczHaAUnr3Xb3X18Bf
 hQ3NeZKwacxXILeF7e/47ST0wUU5obxKZlrErgDXCtJGTl/DTeu7AIyJXv/BRf5MEfyj
 vBjfb0bC4YjHM8zPQqtDy/Ohi4jOzvMjmbg2NvjuGp0Zwoj8L/w6t588ZGogjhSEushY
 gGHOyO2jdxOSnHxud3ZmOVZR0G9sjTKrNo0WYQGYKApHRG4Z05Gnaa+Smbsl73pBUMbh
 zl2OUgvbCzEk3cNbfGPf+PaHab9ZSJ17048ItIEVxhuPJKqJx3H2Io80xqs9WfLujgZa
 dgKg==
X-Gm-Message-State: AJIora8ylVwTLwSNuSM3LK8HBL5fxLloJgtP7RxmkpJeSUTiwx7KXg/y
 W2vOiPpinq8km5cTJUWXynkhm5hYddl9XkTPBeYAQC/8nXraCtVgO2BjRxqtYbOz4Cq6U9P73g+
 iy1S54rs8zeKz3XCwvNICiBCP3Kr7H8gvVhuGawUSEuknghBLgvBb3zBFIQ==
X-Received: by 2002:a05:6512:3f0f:b0:47f:6f89:326 with SMTP id
 y15-20020a0565123f0f00b0047f6f890326mr1479643lfa.124.1655887894455; 
 Wed, 22 Jun 2022 01:51:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tw3xOnAQuHg6VoT5TUnaUmeyE/BPH6hjtiGyZ141/1ME/JjMOrdCgl5a9KNto8piHei6HFGW8aCgbsYD2ZMOw=
X-Received: by 2002:a05:6512:3f0f:b0:47f:6f89:326 with SMTP id
 y15-20020a0565123f0f00b0047f6f890326mr1479624lfa.124.1655887894139; Wed, 22
 Jun 2022 01:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220616101823-mutt-send-email-mst@kernel.org>
 <20220617020411.80367-1-huangjie.albert@bytedance.com>
In-Reply-To: <20220617020411.80367-1-huangjie.albert@bytedance.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 22 Jun 2022 16:51:22 +0800
Message-ID: <CACGkMEutq89farjWTdPY8R8wq8gCJLU2SWJrv+x=pPA5fv6+Uw@mail.gmail.com>
Subject: Re: [PATCH v4] virtio_ring : keep used_wrap_counter in
 vq->last_used_idx
To: Albert Huang <huangjie.albert@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 yuanzhu@bytedance.com, mst <mst@redhat.com>
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

T24gRnJpLCBKdW4gMTcsIDIwMjIgYXQgMTA6MDQgQU0gQWxiZXJ0IEh1YW5nCjxodWFuZ2ppZS5h
bGJlcnRAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiAiaHVhbmdqaWUuYWxiZXJ0IiA8
aHVhbmdqaWUuYWxiZXJ0QGJ5dGVkYW5jZS5jb20+Cj4KPiB0aGUgdXNlZF93cmFwX2NvdW50ZXIg
YW5kIHRoZSB2cS0+bGFzdF91c2VkX2lkeCBtYXkgZ2V0Cj4gb3V0IG9mIHN5bmMgaWYgdGhleSBh
cmUgc2VwYXJhdGUgYXNzaWdubWVudO+8jGFuZCBpbnRlcnJ1cHQKPiBtaWdodCB1c2UgYW4gaW5j
b3JyZWN0IHZhbHVlIHRvIGNoZWNrIGZvciB0aGUgdXNlZCBpbmRleC4KPgo+IGZvciBleGFtcGxl
Ok9PQiBhY2Nlc3MKPiBrc29mdGlycWQgbWF5IGNvbnN1bWUgdGhlIHBhY2tldCBhbmQgaXQgd2ls
bCBjYWxsOgo+IHZpcnRuZXRfcG9sbAo+ICAgICAgICAgLS0+dmlydG5ldF9yZWNlaXZlCj4gICAg
ICAgICAgICAgICAgIC0tPnZpcnRxdWV1ZV9nZXRfYnVmX2N0eAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIC0tPnZpcnRxdWV1ZV9nZXRfYnVmX2N0eF9wYWNrZWQKPiBhbmQgaW4gdmlydHF1ZXVl
X2dldF9idWZfY3R4X3BhY2tlZDoKPgo+IHZxLT5sYXN0X3VzZWRfaWR4ICs9IHZxLT5wYWNrZWQu
ZGVzY19zdGF0ZVtpZF0ubnVtOwo+IGlmICh1bmxpa2VseSh2cS0+bGFzdF91c2VkX2lkeCA+PSB2
cS0+cGFja2VkLnZyaW5nLm51bSkpIHsKPiAgICAgICAgICB2cS0+bGFzdF91c2VkX2lkeCAtPSB2
cS0+cGFja2VkLnZyaW5nLm51bTsKPiAgICAgICAgICB2cS0+cGFja2VkLnVzZWRfd3JhcF9jb3Vu
dGVyIF49IDE7Cj4gfQo+Cj4gaWYgYXQgdGhlIHNhbWUgdGltZSwgdGhlcmUgY29tZXMgYSB2cmlu
ZyBpbnRlcnJ1cHTvvIxpbiB2cmluZ19pbnRlcnJ1cHQ6Cj4gd2Ugd2lsbCBjYWxsOgo+IHZyaW5n
X2ludGVycnVwdAo+ICAgICAgICAgLS0+bW9yZV91c2VkCj4gICAgICAgICAgICAgICAgIC0tPm1v
cmVfdXNlZF9wYWNrZWQKPiAgICAgICAgICAgICAgICAgICAgICAgICAtLT5pc191c2VkX2Rlc2Nf
cGFja2VkCj4gaW4gaXNfdXNlZF9kZXNjX3BhY2tlZCwgdGhlIGxhc3RfdXNlZF9pZHggbWF5YmUg
Pj0gdnEtPnBhY2tlZC52cmluZy5udW0uCj4gc28gdGhpcyBjb3VsZCBjYXNlIGEgbWVtb3J5IG91
dCBvZiBib3VuZHMgYnVnLgo+Cj4gdGhpcyBwYXRjaCBpcyB0byBrZWVwIHRoZSB1c2VkX3dyYXBf
Y291bnRlciBpbiB2cS0+bGFzdF91c2VkX2lkeAo+IHNvIHdlIGNhbiBnZXQgdGhlIGNvcnJlY3Qg
dmFsdWUgdG8gY2hlY2sgZm9yIHVzZWQgaW5kZXggaW4gaW50ZXJydXB0Lgo+Cj4gdjMtPnY0Ogo+
IC0gdXNlIFJFQURfT05DRS9XUklURV9PTkNFIHRvIGdldC9zZXQgdnEtPmxhc3RfdXNlZF9pZHgK
Pgo+IHYyLT52MzoKPiAtIGFkZCBpbmxpbmUgZnVuY3Rpb24gdG8gZ2V0IHVzZWRfd3JhcF9jb3Vu
dGVyIGFuZCBsYXN0X3VzZWQKPiAtIHdoZW4gdXNlIHZxLT5sYXN0X3VzZWRfaWR4LCBvbmx5IHJl
YWQgb25jZQo+ICAgaWYgdnEtPmxhc3RfdXNlZF9pZHggaXMgcmVhZCB0d2ljZSwgdGhlIHZhbHVl
cyBjYW4gYmUgaW5jb25zaXN0ZW50Lgo+IC0gdXNlIGxhc3RfdXNlZF9pZHggJiB+KC0oMSA8PCBW
UklOR19QQUNLRURfRVZFTlRfRl9XUkFQX0NUUikpCj4gICB0byBnZXQgdGhlIGFsbCBiaXRzIGJl
bG93IFZSSU5HX1BBQ0tFRF9FVkVOVF9GX1dSQVBfQ1RSCj4KPiB2MS0+djI6Cj4gLSByZXVzZSB0
aGUgVlJJTkdfUEFDS0VEX0VWRU5UX0ZfV1JBUF9DVFIKPiAtIFJlbW92ZSBwYXJhbWV0ZXIganVk
Z21lbnQgaW4gaXNfdXNlZF9kZXNjX3BhY2tlZCwKPiBiZWNhdXNlIGl0IGNhbid0IGJlIGlsbGVn
YWwKPgo+IFNpZ25lZC1vZmYtYnk6IGh1YW5namllLmFsYmVydCA8aHVhbmdqaWUuYWxiZXJ0QGJ5
dGVkYW5jZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMgfCA3NSAr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQ3
IGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dmlydGlvL3ZpcnRpb19yaW5nLmMgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jCj4gaW5k
ZXggMTNhNzM0OGNlZGZmLi43MTlmYmJlNzE2ZDYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aXJ0
aW8vdmlydGlvX3JpbmcuYwo+ICsrKyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMKPiBA
QCAtMTExLDcgKzExMSwxMiBAQCBzdHJ1Y3QgdnJpbmdfdmlydHF1ZXVlIHsKPiAgICAgICAgIC8q
IE51bWJlciB3ZSd2ZSBhZGRlZCBzaW5jZSBsYXN0IHN5bmMuICovCj4gICAgICAgICB1bnNpZ25l
ZCBpbnQgbnVtX2FkZGVkOwo+Cj4gLSAgICAgICAvKiBMYXN0IHVzZWQgaW5kZXggd2UndmUgc2Vl
bi4gKi8KPiArICAgICAgIC8qIExhc3QgdXNlZCBpbmRleCAgd2UndmUgc2Vlbi4KPiArICAgICAg
ICAqIGZvciBzcGxpdCByaW5nLCBpdCBqdXN0IGNvbnRhaW5zIGxhc3QgdXNlZCBpbmRleAo+ICsg
ICAgICAgICogZm9yIHBhY2tlZCByaW5nOgo+ICsgICAgICAgICogYml0cyB1cCB0byBWUklOR19Q
QUNLRURfRVZFTlRfRl9XUkFQX0NUUiBpbmNsdWRlIHRoZSBsYXN0IHVzZWQgaW5kZXguCj4gKyAg
ICAgICAgKiBiaXRzIGZyb20gVlJJTkdfUEFDS0VEX0VWRU5UX0ZfV1JBUF9DVFIgaW5jbHVkZSB0
aGUgdXNlZCB3cmFwIGNvdW50ZXIuCj4gKyAgICAgICAgKi8KPiAgICAgICAgIHUxNiBsYXN0X3Vz
ZWRfaWR4Owo+Cj4gICAgICAgICAvKiBIaW50IGZvciBldmVudCBpZHg6IGFscmVhZHkgdHJpZ2dl
cmVkIG5vIG5lZWQgdG8gZGlzYWJsZS4gKi8KPiBAQCAtMTU0LDkgKzE1OSw2IEBAIHN0cnVjdCB2
cmluZ192aXJ0cXVldWUgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIC8qIERyaXZlciByaW5n
IHdyYXAgY291bnRlci4gKi8KPiAgICAgICAgICAgICAgICAgICAgICAgICBib29sIGF2YWlsX3dy
YXBfY291bnRlcjsKPgo+IC0gICAgICAgICAgICAgICAgICAgICAgIC8qIERldmljZSByaW5nIHdy
YXAgY291bnRlci4gKi8KPiAtICAgICAgICAgICAgICAgICAgICAgICBib29sIHVzZWRfd3JhcF9j
b3VudGVyOwo+IC0KPiAgICAgICAgICAgICAgICAgICAgICAgICAvKiBBdmFpbCB1c2VkIGZsYWdz
LiAqLwo+ICAgICAgICAgICAgICAgICAgICAgICAgIHUxNiBhdmFpbF91c2VkX2ZsYWdzOwo+Cj4g
QEAgLTk3Myw2ICs5NzUsMTUgQEAgc3RhdGljIHN0cnVjdCB2aXJ0cXVldWUgKnZyaW5nX2NyZWF0
ZV92aXJ0cXVldWVfc3BsaXQoCj4gIC8qCj4gICAqIFBhY2tlZCByaW5nIHNwZWNpZmljIGZ1bmN0
aW9ucyAtICpfcGFja2VkKCkuCj4gICAqLwo+ICtzdGF0aWMgaW5saW5lIGJvb2wgcGFja2VkX3Vz
ZWRfd3JhcF9jb3VudGVyKHUxNiBsYXN0X3VzZWRfaWR4KQo+ICt7Cj4gKyAgICAgICByZXR1cm4g
ISEobGFzdF91c2VkX2lkeCAmICgxIDw8IFZSSU5HX1BBQ0tFRF9FVkVOVF9GX1dSQVBfQ1RSKSk7
Cj4gK30KPiArCj4gK3N0YXRpYyBpbmxpbmUgdTE2IHBhY2tlZF9sYXN0X3VzZWQodTE2IGxhc3Rf
dXNlZF9pZHgpCj4gK3sKPiArICAgICAgIHJldHVybiBsYXN0X3VzZWRfaWR4ICYgfigtKDEgPDwg
VlJJTkdfUEFDS0VEX0VWRU5UX0ZfV1JBUF9DVFIpKTsKPiArfQoKQW55IHJlYXNvbiB3ZSBuZWVk
IGEgbWludXMgYWZ0ZXIgdGhlIHNoaWZ0PwoKT3RoZXJzIGxvb2sgZ29vZC4KClRoYW5rcwoKPgo+
ICBzdGF0aWMgdm9pZCB2cmluZ191bm1hcF9leHRyYV9wYWNrZWQoY29uc3Qgc3RydWN0IHZyaW5n
X3ZpcnRxdWV1ZSAqdnEsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCB2cmluZ19kZXNjX2V4dHJhICpleHRyYSkKPiBAQCAtMTQwNiw4ICsxNDE3LDE0IEBAIHN0
YXRpYyBpbmxpbmUgYm9vbCBpc191c2VkX2Rlc2NfcGFja2VkKGNvbnN0IHN0cnVjdCB2cmluZ192
aXJ0cXVldWUgKnZxLAo+Cj4gIHN0YXRpYyBpbmxpbmUgYm9vbCBtb3JlX3VzZWRfcGFja2VkKGNv
bnN0IHN0cnVjdCB2cmluZ192aXJ0cXVldWUgKnZxKQo+ICB7Cj4gLSAgICAgICByZXR1cm4gaXNf
dXNlZF9kZXNjX3BhY2tlZCh2cSwgdnEtPmxhc3RfdXNlZF9pZHgsCj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgdnEtPnBhY2tlZC51c2VkX3dyYXBfY291bnRlcik7Cj4gKyAgICAgICB1MTYgbGFz
dF91c2VkOwo+ICsgICAgICAgdTE2IGxhc3RfdXNlZF9pZHg7Cj4gKyAgICAgICBib29sIHVzZWRf
d3JhcF9jb3VudGVyOwo+ICsKPiArICAgICAgIGxhc3RfdXNlZF9pZHggPSBSRUFEX09OQ0UodnEt
Pmxhc3RfdXNlZF9pZHgpOwo+ICsgICAgICAgbGFzdF91c2VkID0gcGFja2VkX2xhc3RfdXNlZChs
YXN0X3VzZWRfaWR4KTsKPiArICAgICAgIHVzZWRfd3JhcF9jb3VudGVyID0gcGFja2VkX3VzZWRf
d3JhcF9jb3VudGVyKGxhc3RfdXNlZF9pZHgpOwo+ICsgICAgICAgcmV0dXJuIGlzX3VzZWRfZGVz
Y19wYWNrZWQodnEsIGxhc3RfdXNlZCwgdXNlZF93cmFwX2NvdW50ZXIpOwo+ICB9Cj4KPiAgc3Rh
dGljIHZvaWQgKnZpcnRxdWV1ZV9nZXRfYnVmX2N0eF9wYWNrZWQoc3RydWN0IHZpcnRxdWV1ZSAq
X3ZxLAo+IEBAIC0xNDE1LDcgKzE0MzIsOCBAQCBzdGF0aWMgdm9pZCAqdmlydHF1ZXVlX2dldF9i
dWZfY3R4X3BhY2tlZChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEsCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqKmN0eCkKPiAgewo+ICAgICAgICAgc3RydWN0
IHZyaW5nX3ZpcnRxdWV1ZSAqdnEgPSB0b192dnEoX3ZxKTsKPiAtICAgICAgIHUxNiBsYXN0X3Vz
ZWQsIGlkOwo+ICsgICAgICAgdTE2IGxhc3RfdXNlZCwgaWQsIGxhc3RfdXNlZF9pZHg7Cj4gKyAg
ICAgICBib29sIHVzZWRfd3JhcF9jb3VudGVyOwo+ICAgICAgICAgdm9pZCAqcmV0Owo+Cj4gICAg
ICAgICBTVEFSVF9VU0UodnEpOwo+IEBAIC0xNDM0LDcgKzE0NTIsOSBAQCBzdGF0aWMgdm9pZCAq
dmlydHF1ZXVlX2dldF9idWZfY3R4X3BhY2tlZChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEsCj4gICAg
ICAgICAvKiBPbmx5IGdldCB1c2VkIGVsZW1lbnRzIGFmdGVyIHRoZXkgaGF2ZSBiZWVuIGV4cG9z
ZWQgYnkgaG9zdC4gKi8KPiAgICAgICAgIHZpcnRpb19ybWIodnEtPndlYWtfYmFycmllcnMpOwo+
Cj4gLSAgICAgICBsYXN0X3VzZWQgPSB2cS0+bGFzdF91c2VkX2lkeDsKPiArICAgICAgIGxhc3Rf
dXNlZF9pZHggPSBSRUFEX09OQ0UodnEtPmxhc3RfdXNlZF9pZHgpOwo+ICsgICAgICAgdXNlZF93
cmFwX2NvdW50ZXIgPSBwYWNrZWRfdXNlZF93cmFwX2NvdW50ZXIobGFzdF91c2VkX2lkeCk7Cj4g
KyAgICAgICBsYXN0X3VzZWQgPSBwYWNrZWRfbGFzdF91c2VkKGxhc3RfdXNlZF9pZHgpOwo+ICAg
ICAgICAgaWQgPSBsZTE2X3RvX2NwdSh2cS0+cGFja2VkLnZyaW5nLmRlc2NbbGFzdF91c2VkXS5p
ZCk7Cj4gICAgICAgICAqbGVuID0gbGUzMl90b19jcHUodnEtPnBhY2tlZC52cmluZy5kZXNjW2xh
c3RfdXNlZF0ubGVuKTsKPgo+IEBAIC0xNDUxLDEyICsxNDcxLDE1IEBAIHN0YXRpYyB2b2lkICp2
aXJ0cXVldWVfZ2V0X2J1Zl9jdHhfcGFja2VkKHN0cnVjdCB2aXJ0cXVldWUgKl92cSwKPiAgICAg
ICAgIHJldCA9IHZxLT5wYWNrZWQuZGVzY19zdGF0ZVtpZF0uZGF0YTsKPiAgICAgICAgIGRldGFj
aF9idWZfcGFja2VkKHZxLCBpZCwgY3R4KTsKPgo+IC0gICAgICAgdnEtPmxhc3RfdXNlZF9pZHgg
Kz0gdnEtPnBhY2tlZC5kZXNjX3N0YXRlW2lkXS5udW07Cj4gLSAgICAgICBpZiAodW5saWtlbHko
dnEtPmxhc3RfdXNlZF9pZHggPj0gdnEtPnBhY2tlZC52cmluZy5udW0pKSB7Cj4gLSAgICAgICAg
ICAgICAgIHZxLT5sYXN0X3VzZWRfaWR4IC09IHZxLT5wYWNrZWQudnJpbmcubnVtOwo+IC0gICAg
ICAgICAgICAgICB2cS0+cGFja2VkLnVzZWRfd3JhcF9jb3VudGVyIF49IDE7Cj4gKyAgICAgICBs
YXN0X3VzZWQgKz0gdnEtPnBhY2tlZC5kZXNjX3N0YXRlW2lkXS5udW07Cj4gKyAgICAgICBpZiAo
dW5saWtlbHkobGFzdF91c2VkID49IHZxLT5wYWNrZWQudnJpbmcubnVtKSkgewo+ICsgICAgICAg
ICAgICAgICBsYXN0X3VzZWQgLT0gdnEtPnBhY2tlZC52cmluZy5udW07Cj4gKyAgICAgICAgICAg
ICAgIHVzZWRfd3JhcF9jb3VudGVyIF49IDE7Cj4gICAgICAgICB9Cj4KPiArICAgICAgIGxhc3Rf
dXNlZCA9IChsYXN0X3VzZWQgfCAodXNlZF93cmFwX2NvdW50ZXIgPDwgVlJJTkdfUEFDS0VEX0VW
RU5UX0ZfV1JBUF9DVFIpKTsKPiArICAgICAgIFdSSVRFX09OQ0UodnEtPmxhc3RfdXNlZF9pZHgs
IGxhc3RfdXNlZCk7Cj4gKwo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIElmIHdlIGV4cGVjdCBh
biBpbnRlcnJ1cHQgZm9yIHRoZSBuZXh0IGVudHJ5LCB0ZWxsIGhvc3QKPiAgICAgICAgICAqIGJ5
IHdyaXRpbmcgZXZlbnQgaW5kZXggYW5kIGZsdXNoIG91dCB0aGUgd3JpdGUgYmVmb3JlCj4gQEAg
LTE0NjUsOSArMTQ4OCw3IEBAIHN0YXRpYyB2b2lkICp2aXJ0cXVldWVfZ2V0X2J1Zl9jdHhfcGFj
a2VkKHN0cnVjdCB2aXJ0cXVldWUgKl92cSwKPiAgICAgICAgIGlmICh2cS0+cGFja2VkLmV2ZW50
X2ZsYWdzX3NoYWRvdyA9PSBWUklOR19QQUNLRURfRVZFTlRfRkxBR19ERVNDKQo+ICAgICAgICAg
ICAgICAgICB2aXJ0aW9fc3RvcmVfbWIodnEtPndlYWtfYmFycmllcnMsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAmdnEtPnBhY2tlZC52cmluZy5kcml2ZXItPm9mZl93cmFwLAo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY3B1X3RvX2xlMTYodnEtPmxhc3RfdXNl
ZF9pZHggfAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodnEtPnBh
Y2tlZC51c2VkX3dyYXBfY291bnRlciA8PAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgVlJJTkdfUEFDS0VEX0VWRU5UX0ZfV1JBUF9DVFIpKSk7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjcHVfdG9fbGUxNih2cS0+bGFzdF91c2VkX2lkeCkpOwo+
Cj4gICAgICAgICBMQVNUX0FERF9USU1FX0lOVkFMSUQodnEpOwo+Cj4gQEAgLTE0OTksOSArMTUy
MCw3IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgdmlydHF1ZXVlX2VuYWJsZV9jYl9wcmVwYXJlX3Bh
Y2tlZChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEpCj4KPiAgICAgICAgIGlmICh2cS0+ZXZlbnQpIHsK
PiAgICAgICAgICAgICAgICAgdnEtPnBhY2tlZC52cmluZy5kcml2ZXItPm9mZl93cmFwID0KPiAt
ICAgICAgICAgICAgICAgICAgICAgICBjcHVfdG9fbGUxNih2cS0+bGFzdF91c2VkX2lkeCB8Cj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodnEtPnBhY2tlZC51c2VkX3dyYXBfY291
bnRlciA8PAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFZSSU5HX1BBQ0tFRF9F
VkVOVF9GX1dSQVBfQ1RSKSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY3B1X3RvX2xlMTYo
dnEtPmxhc3RfdXNlZF9pZHgpOwo+ICAgICAgICAgICAgICAgICAvKgo+ICAgICAgICAgICAgICAg
ICAgKiBXZSBuZWVkIHRvIHVwZGF0ZSBldmVudCBvZmZzZXQgYW5kIGV2ZW50IHdyYXAKPiAgICAg
ICAgICAgICAgICAgICogY291bnRlciBmaXJzdCBiZWZvcmUgdXBkYXRpbmcgZXZlbnQgZmxhZ3Mu
Cj4gQEAgLTE1MTgsOCArMTUzNyw3IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgdmlydHF1ZXVlX2Vu
YWJsZV9jYl9wcmVwYXJlX3BhY2tlZChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEpCj4gICAgICAgICB9
Cj4KPiAgICAgICAgIEVORF9VU0UodnEpOwo+IC0gICAgICAgcmV0dXJuIHZxLT5sYXN0X3VzZWRf
aWR4IHwgKCh1MTYpdnEtPnBhY2tlZC51c2VkX3dyYXBfY291bnRlciA8PAo+IC0gICAgICAgICAg
ICAgICAgICAgICAgIFZSSU5HX1BBQ0tFRF9FVkVOVF9GX1dSQVBfQ1RSKTsKPiArICAgICAgIHJl
dHVybiB2cS0+bGFzdF91c2VkX2lkeDsKPiAgfQo+Cj4gIHN0YXRpYyBib29sIHZpcnRxdWV1ZV9w
b2xsX3BhY2tlZChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEsIHUxNiBvZmZfd3JhcCkKPiBAQCAtMTUz
Nyw3ICsxNTU1LDcgQEAgc3RhdGljIGJvb2wgdmlydHF1ZXVlX3BvbGxfcGFja2VkKHN0cnVjdCB2
aXJ0cXVldWUgKl92cSwgdTE2IG9mZl93cmFwKQo+ICBzdGF0aWMgYm9vbCB2aXJ0cXVldWVfZW5h
YmxlX2NiX2RlbGF5ZWRfcGFja2VkKHN0cnVjdCB2aXJ0cXVldWUgKl92cSkKPiAgewo+ICAgICAg
ICAgc3RydWN0IHZyaW5nX3ZpcnRxdWV1ZSAqdnEgPSB0b192dnEoX3ZxKTsKPiAtICAgICAgIHUx
NiB1c2VkX2lkeCwgd3JhcF9jb3VudGVyOwo+ICsgICAgICAgdTE2IHVzZWRfaWR4LCB3cmFwX2Nv
dW50ZXIsIGxhc3RfdXNlZF9pZHg7Cj4gICAgICAgICB1MTYgYnVmczsKPgo+ICAgICAgICAgU1RB
UlRfVVNFKHZxKTsKPiBAQCAtMTU1MCw5ICsxNTY4LDEwIEBAIHN0YXRpYyBib29sIHZpcnRxdWV1
ZV9lbmFibGVfY2JfZGVsYXllZF9wYWNrZWQoc3RydWN0IHZpcnRxdWV1ZSAqX3ZxKQo+ICAgICAg
ICAgaWYgKHZxLT5ldmVudCkgewo+ICAgICAgICAgICAgICAgICAvKiBUT0RPOiB0dW5lIHRoaXMg
dGhyZXNob2xkICovCj4gICAgICAgICAgICAgICAgIGJ1ZnMgPSAodnEtPnBhY2tlZC52cmluZy5u
dW0gLSB2cS0+dnEubnVtX2ZyZWUpICogMyAvIDQ7Cj4gLSAgICAgICAgICAgICAgIHdyYXBfY291
bnRlciA9IHZxLT5wYWNrZWQudXNlZF93cmFwX2NvdW50ZXI7Cj4gKyAgICAgICAgICAgICAgIGxh
c3RfdXNlZF9pZHggPSBSRUFEX09OQ0UodnEtPmxhc3RfdXNlZF9pZHgpOwo+ICsgICAgICAgICAg
ICAgICB3cmFwX2NvdW50ZXIgPSBwYWNrZWRfdXNlZF93cmFwX2NvdW50ZXIobGFzdF91c2VkX2lk
eCk7Cj4KPiAtICAgICAgICAgICAgICAgdXNlZF9pZHggPSB2cS0+bGFzdF91c2VkX2lkeCArIGJ1
ZnM7Cj4gKyAgICAgICAgICAgICAgIHVzZWRfaWR4ID0gcGFja2VkX2xhc3RfdXNlZChsYXN0X3Vz
ZWRfaWR4KSArIGJ1ZnM7Cj4gICAgICAgICAgICAgICAgIGlmICh1c2VkX2lkeCA+PSB2cS0+cGFj
a2VkLnZyaW5nLm51bSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIHVzZWRfaWR4IC09IHZx
LT5wYWNrZWQudnJpbmcubnVtOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIHdyYXBfY291bnRl
ciBePSAxOwo+IEBAIC0xNTgyLDkgKzE2MDEsMTAgQEAgc3RhdGljIGJvb2wgdmlydHF1ZXVlX2Vu
YWJsZV9jYl9kZWxheWVkX3BhY2tlZChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEpCj4gICAgICAgICAg
Ki8KPiAgICAgICAgIHZpcnRpb19tYih2cS0+d2Vha19iYXJyaWVycyk7Cj4KPiAtICAgICAgIGlm
IChpc191c2VkX2Rlc2NfcGFja2VkKHZxLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdnEtPmxhc3RfdXNlZF9pZHgsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2
cS0+cGFja2VkLnVzZWRfd3JhcF9jb3VudGVyKSkgewo+ICsgICAgICAgbGFzdF91c2VkX2lkeCA9
IFJFQURfT05DRSh2cS0+bGFzdF91c2VkX2lkeCk7Cj4gKyAgICAgICB3cmFwX2NvdW50ZXIgPSBw
YWNrZWRfdXNlZF93cmFwX2NvdW50ZXIobGFzdF91c2VkX2lkeCk7Cj4gKyAgICAgICB1c2VkX2lk
eCA9IHBhY2tlZF9sYXN0X3VzZWQobGFzdF91c2VkX2lkeCk7Cj4gKyAgICAgICBpZiAoaXNfdXNl
ZF9kZXNjX3BhY2tlZCh2cSwgdXNlZF9pZHgsIHdyYXBfY291bnRlcikpIHsKPiAgICAgICAgICAg
ICAgICAgRU5EX1VTRSh2cSk7Cj4gICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiAgICAg
ICAgIH0KPiBAQCAtMTY4OSw3ICsxNzA5LDcgQEAgc3RhdGljIHN0cnVjdCB2aXJ0cXVldWUgKnZy
aW5nX2NyZWF0ZV92aXJ0cXVldWVfcGFja2VkKAo+ICAgICAgICAgdnEtPm5vdGlmeSA9IG5vdGlm
eTsKPiAgICAgICAgIHZxLT53ZWFrX2JhcnJpZXJzID0gd2Vha19iYXJyaWVyczsKPiAgICAgICAg
IHZxLT5icm9rZW4gPSB0cnVlOwo+IC0gICAgICAgdnEtPmxhc3RfdXNlZF9pZHggPSAwOwo+ICsg
ICAgICAgdnEtPmxhc3RfdXNlZF9pZHggPSAwIHwgKDEgPDwgVlJJTkdfUEFDS0VEX0VWRU5UX0Zf
V1JBUF9DVFIpOwo+ICAgICAgICAgdnEtPmV2ZW50X3RyaWdnZXJlZCA9IGZhbHNlOwo+ICAgICAg
ICAgdnEtPm51bV9hZGRlZCA9IDA7Cj4gICAgICAgICB2cS0+cGFja2VkX3JpbmcgPSB0cnVlOwo+
IEBAIC0xNzIwLDcgKzE3NDAsNiBAQCBzdGF0aWMgc3RydWN0IHZpcnRxdWV1ZSAqdnJpbmdfY3Jl
YXRlX3ZpcnRxdWV1ZV9wYWNrZWQoCj4KPiAgICAgICAgIHZxLT5wYWNrZWQubmV4dF9hdmFpbF9p
ZHggPSAwOwo+ICAgICAgICAgdnEtPnBhY2tlZC5hdmFpbF93cmFwX2NvdW50ZXIgPSAxOwo+IC0g
ICAgICAgdnEtPnBhY2tlZC51c2VkX3dyYXBfY291bnRlciA9IDE7Cj4gICAgICAgICB2cS0+cGFj
a2VkLmV2ZW50X2ZsYWdzX3NoYWRvdyA9IDA7Cj4gICAgICAgICB2cS0+cGFja2VkLmF2YWlsX3Vz
ZWRfZmxhZ3MgPSAxIDw8IFZSSU5HX1BBQ0tFRF9ERVNDX0ZfQVZBSUw7Cj4KPiAtLQo+IDIuMzEu
MQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0
dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vdmlydHVhbGl6YXRpb24=
