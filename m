Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEFA5548FA
	for <lists.virtualization@lfdr.de>; Wed, 22 Jun 2022 14:16:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BA3B40C90;
	Wed, 22 Jun 2022 12:16:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BA3B40C90
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J3rLlm7h
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id veguC8VqQp3I; Wed, 22 Jun 2022 12:16:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EA37F40517;
	Wed, 22 Jun 2022 12:16:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA37F40517
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 345E9C0081;
	Wed, 22 Jun 2022 12:16:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1E9A1C002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jun 2022 12:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DED0960ACA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jun 2022 12:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DED0960ACA
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=J3rLlm7h
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WEVN1JCngY0R
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jun 2022 12:16:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A5DA6059B
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A5DA6059B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jun 2022 12:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655900190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XoDeMBCeVzMlgBfTAwYB0I3631v+ktVlhk8JNQ3EZfU=;
 b=J3rLlm7hoGQ1iuGM8+TIBu4+7mEi4cSTFP6iDoP8mawss82DDFar74NMHGXaxwIFYY6pid
 es1G40gH9X8zvl2NlH8K4cDfC2zsKd/uELlyai6mVcDScZQH99KRn4hy0KeNxkeI+pXBBb
 fB7pRcOMWvnGOwhnYvdG/4DIWfDqkcU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-XOxvPfLpPCW8yv1vnUDuGw-1; Wed, 22 Jun 2022 08:16:28 -0400
X-MC-Unique: XOxvPfLpPCW8yv1vnUDuGw-1
Received: by mail-wr1-f71.google.com with SMTP id
 e21-20020adfa455000000b0021b80b12356so3454511wra.5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jun 2022 05:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XoDeMBCeVzMlgBfTAwYB0I3631v+ktVlhk8JNQ3EZfU=;
 b=0M7mUZZEkh3QQlM8BiT7z2bz3S3ERxUVeCIQFmPdz42nn2Izr+34hv9rDb0Sz1vOu/
 4eRhCe1VXcwrqS1JGaSJFMib+yCPkWeVp4OvlOcE1uM0QV7rq6PCGjUg4AQCZ7P239gC
 fwb5XMVsdDYw8WQWDVCjLoAjdancUkAVLDnlj3MeR6abwunokSbH0kxhlYvNZ13fBe4m
 HofJqHd3N5j0GGictOGjeK8MInrmFie4GWn0POT85Ue2Fcjpzl4HtZsDmWQ2XPiNhHnA
 ybR2LlXAmbJER9/ZQP4Y/UPEnsEC/lIxDlsmvxQD7Ml/XMW8FsqKawJJILeN2AAl0HJi
 TqwA==
X-Gm-Message-State: AJIora9TcR/y/ql9wra/jGZnmccBLTyucbSPm/FDLQFCGjAZtFC8gLKf
 MEQJSh+n95fG8kHfGdL9AncHZoXj0NF6WPzyyqbp2h51cFzu37nvK+pOTRSiNkRtIB2RfiTWsAN
 OHiJpjbzBTXbE4jDNwcPuXPdEsSJbLiHyR45F14vyBw==
X-Received: by 2002:a05:600c:19c7:b0:39c:30b0:2b05 with SMTP id
 u7-20020a05600c19c700b0039c30b02b05mr3597024wmq.170.1655900187632; 
 Wed, 22 Jun 2022 05:16:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sc9uxDXxMU62BbIEFuMDI9eM3c4B0YBdqfnGn471XscoRoAtj8LU6P6b5cA5xPMdZfZu8sEg==
X-Received: by 2002:a05:600c:19c7:b0:39c:30b0:2b05 with SMTP id
 u7-20020a05600c19c700b0039c30b02b05mr3596990wmq.170.1655900187280; 
 Wed, 22 Jun 2022 05:16:27 -0700 (PDT)
Received: from redhat.com ([147.235.217.93]) by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c2cb100b00397393419e3sm26688154wmc.28.2022.06.22.05.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 05:16:26 -0700 (PDT)
Date: Wed, 22 Jun 2022 08:16:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v4] virtio_ring : keep used_wrap_counter in
 vq->last_used_idx
Message-ID: <20220622081543-mutt-send-email-mst@kernel.org>
References: <20220616101823-mutt-send-email-mst@kernel.org>
 <20220617020411.80367-1-huangjie.albert@bytedance.com>
 <CACGkMEutq89farjWTdPY8R8wq8gCJLU2SWJrv+x=pPA5fv6+Uw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEutq89farjWTdPY8R8wq8gCJLU2SWJrv+x=pPA5fv6+Uw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Albert Huang <huangjie.albert@bytedance.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, yuanzhu@bytedance.com,
 virtualization <virtualization@lists.linux-foundation.org>
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

T24gV2VkLCBKdW4gMjIsIDIwMjIgYXQgMDQ6NTE6MjJQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBPbiBGcmksIEp1biAxNywgMjAyMiBhdCAxMDowNCBBTSBBbGJlcnQgSHVhbmcKPiA8aHVh
bmdqaWUuYWxiZXJ0QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4KPiA+IEZyb206ICJodWFuZ2pp
ZS5hbGJlcnQiIDxodWFuZ2ppZS5hbGJlcnRAYnl0ZWRhbmNlLmNvbT4KPiA+Cj4gPiB0aGUgdXNl
ZF93cmFwX2NvdW50ZXIgYW5kIHRoZSB2cS0+bGFzdF91c2VkX2lkeCBtYXkgZ2V0Cj4gPiBvdXQg
b2Ygc3luYyBpZiB0aGV5IGFyZSBzZXBhcmF0ZSBhc3NpZ25tZW5077yMYW5kIGludGVycnVwdAo+
ID4gbWlnaHQgdXNlIGFuIGluY29ycmVjdCB2YWx1ZSB0byBjaGVjayBmb3IgdGhlIHVzZWQgaW5k
ZXguCj4gPgo+ID4gZm9yIGV4YW1wbGU6T09CIGFjY2Vzcwo+ID4ga3NvZnRpcnFkIG1heSBjb25z
dW1lIHRoZSBwYWNrZXQgYW5kIGl0IHdpbGwgY2FsbDoKPiA+IHZpcnRuZXRfcG9sbAo+ID4gICAg
ICAgICAtLT52aXJ0bmV0X3JlY2VpdmUKPiA+ICAgICAgICAgICAgICAgICAtLT52aXJ0cXVldWVf
Z2V0X2J1Zl9jdHgKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIC0tPnZpcnRxdWV1ZV9nZXRf
YnVmX2N0eF9wYWNrZWQKPiA+IGFuZCBpbiB2aXJ0cXVldWVfZ2V0X2J1Zl9jdHhfcGFja2VkOgo+
ID4KPiA+IHZxLT5sYXN0X3VzZWRfaWR4ICs9IHZxLT5wYWNrZWQuZGVzY19zdGF0ZVtpZF0ubnVt
Owo+ID4gaWYgKHVubGlrZWx5KHZxLT5sYXN0X3VzZWRfaWR4ID49IHZxLT5wYWNrZWQudnJpbmcu
bnVtKSkgewo+ID4gICAgICAgICAgdnEtPmxhc3RfdXNlZF9pZHggLT0gdnEtPnBhY2tlZC52cmlu
Zy5udW07Cj4gPiAgICAgICAgICB2cS0+cGFja2VkLnVzZWRfd3JhcF9jb3VudGVyIF49IDE7Cj4g
PiB9Cj4gPgo+ID4gaWYgYXQgdGhlIHNhbWUgdGltZSwgdGhlcmUgY29tZXMgYSB2cmluZyBpbnRl
cnJ1cHTvvIxpbiB2cmluZ19pbnRlcnJ1cHQ6Cj4gPiB3ZSB3aWxsIGNhbGw6Cj4gPiB2cmluZ19p
bnRlcnJ1cHQKPiA+ICAgICAgICAgLS0+bW9yZV91c2VkCj4gPiAgICAgICAgICAgICAgICAgLS0+
bW9yZV91c2VkX3BhY2tlZAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgLS0+aXNfdXNlZF9k
ZXNjX3BhY2tlZAo+ID4gaW4gaXNfdXNlZF9kZXNjX3BhY2tlZCwgdGhlIGxhc3RfdXNlZF9pZHgg
bWF5YmUgPj0gdnEtPnBhY2tlZC52cmluZy5udW0uCj4gPiBzbyB0aGlzIGNvdWxkIGNhc2UgYSBt
ZW1vcnkgb3V0IG9mIGJvdW5kcyBidWcuCj4gPgo+ID4gdGhpcyBwYXRjaCBpcyB0byBrZWVwIHRo
ZSB1c2VkX3dyYXBfY291bnRlciBpbiB2cS0+bGFzdF91c2VkX2lkeAo+ID4gc28gd2UgY2FuIGdl
dCB0aGUgY29ycmVjdCB2YWx1ZSB0byBjaGVjayBmb3IgdXNlZCBpbmRleCBpbiBpbnRlcnJ1cHQu
Cj4gPgo+ID4gdjMtPnY0Ogo+ID4gLSB1c2UgUkVBRF9PTkNFL1dSSVRFX09OQ0UgdG8gZ2V0L3Nl
dCB2cS0+bGFzdF91c2VkX2lkeAo+ID4KPiA+IHYyLT52MzoKPiA+IC0gYWRkIGlubGluZSBmdW5j
dGlvbiB0byBnZXQgdXNlZF93cmFwX2NvdW50ZXIgYW5kIGxhc3RfdXNlZAo+ID4gLSB3aGVuIHVz
ZSB2cS0+bGFzdF91c2VkX2lkeCwgb25seSByZWFkIG9uY2UKPiA+ICAgaWYgdnEtPmxhc3RfdXNl
ZF9pZHggaXMgcmVhZCB0d2ljZSwgdGhlIHZhbHVlcyBjYW4gYmUgaW5jb25zaXN0ZW50Lgo+ID4g
LSB1c2UgbGFzdF91c2VkX2lkeCAmIH4oLSgxIDw8IFZSSU5HX1BBQ0tFRF9FVkVOVF9GX1dSQVBf
Q1RSKSkKPiA+ICAgdG8gZ2V0IHRoZSBhbGwgYml0cyBiZWxvdyBWUklOR19QQUNLRURfRVZFTlRf
Rl9XUkFQX0NUUgo+ID4KPiA+IHYxLT52MjoKPiA+IC0gcmV1c2UgdGhlIFZSSU5HX1BBQ0tFRF9F
VkVOVF9GX1dSQVBfQ1RSCj4gPiAtIFJlbW92ZSBwYXJhbWV0ZXIganVkZ21lbnQgaW4gaXNfdXNl
ZF9kZXNjX3BhY2tlZCwKPiA+IGJlY2F1c2UgaXQgY2FuJ3QgYmUgaWxsZWdhbAo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IGh1YW5namllLmFsYmVydCA8aHVhbmdqaWUuYWxiZXJ0QGJ5dGVkYW5jZS5j
b20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jIHwgNzUgKysrKysr
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQ3IGlu
c2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3ZpcnRpby92aXJ0aW9fcmluZy5jIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYwo+ID4g
aW5kZXggMTNhNzM0OGNlZGZmLi43MTlmYmJlNzE2ZDYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L3ZpcnRpby92aXJ0aW9fcmluZy5jCj4gPiArKysgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmlu
Zy5jCj4gPiBAQCAtMTExLDcgKzExMSwxMiBAQCBzdHJ1Y3QgdnJpbmdfdmlydHF1ZXVlIHsKPiA+
ICAgICAgICAgLyogTnVtYmVyIHdlJ3ZlIGFkZGVkIHNpbmNlIGxhc3Qgc3luYy4gKi8KPiA+ICAg
ICAgICAgdW5zaWduZWQgaW50IG51bV9hZGRlZDsKPiA+Cj4gPiAtICAgICAgIC8qIExhc3QgdXNl
ZCBpbmRleCB3ZSd2ZSBzZWVuLiAqLwo+ID4gKyAgICAgICAvKiBMYXN0IHVzZWQgaW5kZXggIHdl
J3ZlIHNlZW4uCj4gPiArICAgICAgICAqIGZvciBzcGxpdCByaW5nLCBpdCBqdXN0IGNvbnRhaW5z
IGxhc3QgdXNlZCBpbmRleAo+ID4gKyAgICAgICAgKiBmb3IgcGFja2VkIHJpbmc6Cj4gPiArICAg
ICAgICAqIGJpdHMgdXAgdG8gVlJJTkdfUEFDS0VEX0VWRU5UX0ZfV1JBUF9DVFIgaW5jbHVkZSB0
aGUgbGFzdCB1c2VkIGluZGV4Lgo+ID4gKyAgICAgICAgKiBiaXRzIGZyb20gVlJJTkdfUEFDS0VE
X0VWRU5UX0ZfV1JBUF9DVFIgaW5jbHVkZSB0aGUgdXNlZCB3cmFwIGNvdW50ZXIuCj4gPiArICAg
ICAgICAqLwo+ID4gICAgICAgICB1MTYgbGFzdF91c2VkX2lkeDsKPiA+Cj4gPiAgICAgICAgIC8q
IEhpbnQgZm9yIGV2ZW50IGlkeDogYWxyZWFkeSB0cmlnZ2VyZWQgbm8gbmVlZCB0byBkaXNhYmxl
LiAqLwo+ID4gQEAgLTE1NCw5ICsxNTksNiBAQCBzdHJ1Y3QgdnJpbmdfdmlydHF1ZXVlIHsKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgIC8qIERyaXZlciByaW5nIHdyYXAgY291bnRlci4gKi8K
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgYXZhaWxfd3JhcF9jb3VudGVyOwo+ID4K
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgIC8qIERldmljZSByaW5nIHdyYXAgY291bnRlci4g
Ki8KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGJvb2wgdXNlZF93cmFwX2NvdW50ZXI7Cj4g
PiAtCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAvKiBBdmFpbCB1c2VkIGZsYWdzLiAqLwo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgdTE2IGF2YWlsX3VzZWRfZmxhZ3M7Cj4gPgo+ID4g
QEAgLTk3Myw2ICs5NzUsMTUgQEAgc3RhdGljIHN0cnVjdCB2aXJ0cXVldWUgKnZyaW5nX2NyZWF0
ZV92aXJ0cXVldWVfc3BsaXQoCj4gPiAgLyoKPiA+ICAgKiBQYWNrZWQgcmluZyBzcGVjaWZpYyBm
dW5jdGlvbnMgLSAqX3BhY2tlZCgpLgo+ID4gICAqLwo+ID4gK3N0YXRpYyBpbmxpbmUgYm9vbCBw
YWNrZWRfdXNlZF93cmFwX2NvdW50ZXIodTE2IGxhc3RfdXNlZF9pZHgpCj4gPiArewo+ID4gKyAg
ICAgICByZXR1cm4gISEobGFzdF91c2VkX2lkeCAmICgxIDw8IFZSSU5HX1BBQ0tFRF9FVkVOVF9G
X1dSQVBfQ1RSKSk7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBpbmxpbmUgdTE2IHBhY2tlZF9s
YXN0X3VzZWQodTE2IGxhc3RfdXNlZF9pZHgpCj4gPiArewo+ID4gKyAgICAgICByZXR1cm4gbGFz
dF91c2VkX2lkeCAmIH4oLSgxIDw8IFZSSU5HX1BBQ0tFRF9FVkVOVF9GX1dSQVBfQ1RSKSk7Cj4g
PiArfQo+IAo+IEFueSByZWFzb24gd2UgbmVlZCBhIG1pbnVzIGFmdGVyIHRoZSBzaGlmdD8KClRo
ZSBwb2ludCBpcyB0byBzYXkgImFsbCBiaXRzIGFib3ZlIFZSSU5HX1BBQ0tFRF9FVkVOVF9GX1dS
QVBfQ1RSIi4KSGFzIG5vIGVmZmVjdCBjdXJyZW50bHkgYnV0IHdpbGwgaWYgbGFzdF91c2VkX2lk
eCBpcyBleHRlbmRlZCB0byAzMiBiaXQuCgoKPiBPdGhlcnMgbG9vayBnb29kLgo+IAo+IFRoYW5r
cwo+IAo+ID4KPiA+ICBzdGF0aWMgdm9pZCB2cmluZ191bm1hcF9leHRyYV9wYWNrZWQoY29uc3Qg
c3RydWN0IHZyaW5nX3ZpcnRxdWV1ZSAqdnEsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IHZyaW5nX2Rlc2NfZXh0cmEgKmV4dHJhKQo+ID4gQEAgLTE0MDYs
OCArMTQxNywxNCBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaXNfdXNlZF9kZXNjX3BhY2tlZChjb25z
dCBzdHJ1Y3QgdnJpbmdfdmlydHF1ZXVlICp2cSwKPiA+Cj4gPiAgc3RhdGljIGlubGluZSBib29s
IG1vcmVfdXNlZF9wYWNrZWQoY29uc3Qgc3RydWN0IHZyaW5nX3ZpcnRxdWV1ZSAqdnEpCj4gPiAg
ewo+ID4gLSAgICAgICByZXR1cm4gaXNfdXNlZF9kZXNjX3BhY2tlZCh2cSwgdnEtPmxhc3RfdXNl
ZF9pZHgsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICB2cS0+cGFja2VkLnVzZWRfd3JhcF9j
b3VudGVyKTsKPiA+ICsgICAgICAgdTE2IGxhc3RfdXNlZDsKPiA+ICsgICAgICAgdTE2IGxhc3Rf
dXNlZF9pZHg7Cj4gPiArICAgICAgIGJvb2wgdXNlZF93cmFwX2NvdW50ZXI7Cj4gPiArCj4gPiAr
ICAgICAgIGxhc3RfdXNlZF9pZHggPSBSRUFEX09OQ0UodnEtPmxhc3RfdXNlZF9pZHgpOwo+ID4g
KyAgICAgICBsYXN0X3VzZWQgPSBwYWNrZWRfbGFzdF91c2VkKGxhc3RfdXNlZF9pZHgpOwo+ID4g
KyAgICAgICB1c2VkX3dyYXBfY291bnRlciA9IHBhY2tlZF91c2VkX3dyYXBfY291bnRlcihsYXN0
X3VzZWRfaWR4KTsKPiA+ICsgICAgICAgcmV0dXJuIGlzX3VzZWRfZGVzY19wYWNrZWQodnEsIGxh
c3RfdXNlZCwgdXNlZF93cmFwX2NvdW50ZXIpOwo+ID4gIH0KPiA+Cj4gPiAgc3RhdGljIHZvaWQg
KnZpcnRxdWV1ZV9nZXRfYnVmX2N0eF9wYWNrZWQoc3RydWN0IHZpcnRxdWV1ZSAqX3ZxLAo+ID4g
QEAgLTE0MTUsNyArMTQzMiw4IEBAIHN0YXRpYyB2b2lkICp2aXJ0cXVldWVfZ2V0X2J1Zl9jdHhf
cGFja2VkKHN0cnVjdCB2aXJ0cXVldWUgKl92cSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHZvaWQgKipjdHgpCj4gPiAgewo+ID4gICAgICAgICBzdHJ1Y3Qg
dnJpbmdfdmlydHF1ZXVlICp2cSA9IHRvX3Z2cShfdnEpOwo+ID4gLSAgICAgICB1MTYgbGFzdF91
c2VkLCBpZDsKPiA+ICsgICAgICAgdTE2IGxhc3RfdXNlZCwgaWQsIGxhc3RfdXNlZF9pZHg7Cj4g
PiArICAgICAgIGJvb2wgdXNlZF93cmFwX2NvdW50ZXI7Cj4gPiAgICAgICAgIHZvaWQgKnJldDsK
PiA+Cj4gPiAgICAgICAgIFNUQVJUX1VTRSh2cSk7Cj4gPiBAQCAtMTQzNCw3ICsxNDUyLDkgQEAg
c3RhdGljIHZvaWQgKnZpcnRxdWV1ZV9nZXRfYnVmX2N0eF9wYWNrZWQoc3RydWN0IHZpcnRxdWV1
ZSAqX3ZxLAo+ID4gICAgICAgICAvKiBPbmx5IGdldCB1c2VkIGVsZW1lbnRzIGFmdGVyIHRoZXkg
aGF2ZSBiZWVuIGV4cG9zZWQgYnkgaG9zdC4gKi8KPiA+ICAgICAgICAgdmlydGlvX3JtYih2cS0+
d2Vha19iYXJyaWVycyk7Cj4gPgo+ID4gLSAgICAgICBsYXN0X3VzZWQgPSB2cS0+bGFzdF91c2Vk
X2lkeDsKPiA+ICsgICAgICAgbGFzdF91c2VkX2lkeCA9IFJFQURfT05DRSh2cS0+bGFzdF91c2Vk
X2lkeCk7Cj4gPiArICAgICAgIHVzZWRfd3JhcF9jb3VudGVyID0gcGFja2VkX3VzZWRfd3JhcF9j
b3VudGVyKGxhc3RfdXNlZF9pZHgpOwo+ID4gKyAgICAgICBsYXN0X3VzZWQgPSBwYWNrZWRfbGFz
dF91c2VkKGxhc3RfdXNlZF9pZHgpOwo+ID4gICAgICAgICBpZCA9IGxlMTZfdG9fY3B1KHZxLT5w
YWNrZWQudnJpbmcuZGVzY1tsYXN0X3VzZWRdLmlkKTsKPiA+ICAgICAgICAgKmxlbiA9IGxlMzJf
dG9fY3B1KHZxLT5wYWNrZWQudnJpbmcuZGVzY1tsYXN0X3VzZWRdLmxlbik7Cj4gPgo+ID4gQEAg
LTE0NTEsMTIgKzE0NzEsMTUgQEAgc3RhdGljIHZvaWQgKnZpcnRxdWV1ZV9nZXRfYnVmX2N0eF9w
YWNrZWQoc3RydWN0IHZpcnRxdWV1ZSAqX3ZxLAo+ID4gICAgICAgICByZXQgPSB2cS0+cGFja2Vk
LmRlc2Nfc3RhdGVbaWRdLmRhdGE7Cj4gPiAgICAgICAgIGRldGFjaF9idWZfcGFja2VkKHZxLCBp
ZCwgY3R4KTsKPiA+Cj4gPiAtICAgICAgIHZxLT5sYXN0X3VzZWRfaWR4ICs9IHZxLT5wYWNrZWQu
ZGVzY19zdGF0ZVtpZF0ubnVtOwo+ID4gLSAgICAgICBpZiAodW5saWtlbHkodnEtPmxhc3RfdXNl
ZF9pZHggPj0gdnEtPnBhY2tlZC52cmluZy5udW0pKSB7Cj4gPiAtICAgICAgICAgICAgICAgdnEt
Pmxhc3RfdXNlZF9pZHggLT0gdnEtPnBhY2tlZC52cmluZy5udW07Cj4gPiAtICAgICAgICAgICAg
ICAgdnEtPnBhY2tlZC51c2VkX3dyYXBfY291bnRlciBePSAxOwo+ID4gKyAgICAgICBsYXN0X3Vz
ZWQgKz0gdnEtPnBhY2tlZC5kZXNjX3N0YXRlW2lkXS5udW07Cj4gPiArICAgICAgIGlmICh1bmxp
a2VseShsYXN0X3VzZWQgPj0gdnEtPnBhY2tlZC52cmluZy5udW0pKSB7Cj4gPiArICAgICAgICAg
ICAgICAgbGFzdF91c2VkIC09IHZxLT5wYWNrZWQudnJpbmcubnVtOwo+ID4gKyAgICAgICAgICAg
ICAgIHVzZWRfd3JhcF9jb3VudGVyIF49IDE7Cj4gPiAgICAgICAgIH0KPiA+Cj4gPiArICAgICAg
IGxhc3RfdXNlZCA9IChsYXN0X3VzZWQgfCAodXNlZF93cmFwX2NvdW50ZXIgPDwgVlJJTkdfUEFD
S0VEX0VWRU5UX0ZfV1JBUF9DVFIpKTsKPiA+ICsgICAgICAgV1JJVEVfT05DRSh2cS0+bGFzdF91
c2VkX2lkeCwgbGFzdF91c2VkKTsKPiA+ICsKPiA+ICAgICAgICAgLyoKPiA+ICAgICAgICAgICog
SWYgd2UgZXhwZWN0IGFuIGludGVycnVwdCBmb3IgdGhlIG5leHQgZW50cnksIHRlbGwgaG9zdAo+
ID4gICAgICAgICAgKiBieSB3cml0aW5nIGV2ZW50IGluZGV4IGFuZCBmbHVzaCBvdXQgdGhlIHdy
aXRlIGJlZm9yZQo+ID4gQEAgLTE0NjUsOSArMTQ4OCw3IEBAIHN0YXRpYyB2b2lkICp2aXJ0cXVl
dWVfZ2V0X2J1Zl9jdHhfcGFja2VkKHN0cnVjdCB2aXJ0cXVldWUgKl92cSwKPiA+ICAgICAgICAg
aWYgKHZxLT5wYWNrZWQuZXZlbnRfZmxhZ3Nfc2hhZG93ID09IFZSSU5HX1BBQ0tFRF9FVkVOVF9G
TEFHX0RFU0MpCj4gPiAgICAgICAgICAgICAgICAgdmlydGlvX3N0b3JlX21iKHZxLT53ZWFrX2Jh
cnJpZXJzLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmdnEtPnBhY2tlZC52
cmluZy5kcml2ZXItPm9mZl93cmFwLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjcHVfdG9fbGUxNih2cS0+bGFzdF91c2VkX2lkeCB8Cj4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgKHZxLT5wYWNrZWQudXNlZF93cmFwX2NvdW50ZXIgPDwKPiA+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVlJJTkdfUEFDS0VEX0VW
RU5UX0ZfV1JBUF9DVFIpKSk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNw
dV90b19sZTE2KHZxLT5sYXN0X3VzZWRfaWR4KSk7Cj4gPgo+ID4gICAgICAgICBMQVNUX0FERF9U
SU1FX0lOVkFMSUQodnEpOwo+ID4KPiA+IEBAIC0xNDk5LDkgKzE1MjAsNyBAQCBzdGF0aWMgdW5z
aWduZWQgaW50IHZpcnRxdWV1ZV9lbmFibGVfY2JfcHJlcGFyZV9wYWNrZWQoc3RydWN0IHZpcnRx
dWV1ZSAqX3ZxKQo+ID4KPiA+ICAgICAgICAgaWYgKHZxLT5ldmVudCkgewo+ID4gICAgICAgICAg
ICAgICAgIHZxLT5wYWNrZWQudnJpbmcuZHJpdmVyLT5vZmZfd3JhcCA9Cj4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICBjcHVfdG9fbGUxNih2cS0+bGFzdF91c2VkX2lkeCB8Cj4gPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICh2cS0+cGFja2VkLnVzZWRfd3JhcF9jb3VudGVyIDw8
Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBWUklOR19QQUNLRURfRVZFTlRf
Rl9XUkFQX0NUUikpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY3B1X3RvX2xlMTYodnEt
Pmxhc3RfdXNlZF9pZHgpOwo+ID4gICAgICAgICAgICAgICAgIC8qCj4gPiAgICAgICAgICAgICAg
ICAgICogV2UgbmVlZCB0byB1cGRhdGUgZXZlbnQgb2Zmc2V0IGFuZCBldmVudCB3cmFwCj4gPiAg
ICAgICAgICAgICAgICAgICogY291bnRlciBmaXJzdCBiZWZvcmUgdXBkYXRpbmcgZXZlbnQgZmxh
Z3MuCj4gPiBAQCAtMTUxOCw4ICsxNTM3LDcgQEAgc3RhdGljIHVuc2lnbmVkIGludCB2aXJ0cXVl
dWVfZW5hYmxlX2NiX3ByZXBhcmVfcGFja2VkKHN0cnVjdCB2aXJ0cXVldWUgKl92cSkKPiA+ICAg
ICAgICAgfQo+ID4KPiA+ICAgICAgICAgRU5EX1VTRSh2cSk7Cj4gPiAtICAgICAgIHJldHVybiB2
cS0+bGFzdF91c2VkX2lkeCB8ICgodTE2KXZxLT5wYWNrZWQudXNlZF93cmFwX2NvdW50ZXIgPDwK
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgIFZSSU5HX1BBQ0tFRF9FVkVOVF9GX1dSQVBfQ1RS
KTsKPiA+ICsgICAgICAgcmV0dXJuIHZxLT5sYXN0X3VzZWRfaWR4Owo+ID4gIH0KPiA+Cj4gPiAg
c3RhdGljIGJvb2wgdmlydHF1ZXVlX3BvbGxfcGFja2VkKHN0cnVjdCB2aXJ0cXVldWUgKl92cSwg
dTE2IG9mZl93cmFwKQo+ID4gQEAgLTE1MzcsNyArMTU1NSw3IEBAIHN0YXRpYyBib29sIHZpcnRx
dWV1ZV9wb2xsX3BhY2tlZChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEsIHUxNiBvZmZfd3JhcCkKPiA+
ICBzdGF0aWMgYm9vbCB2aXJ0cXVldWVfZW5hYmxlX2NiX2RlbGF5ZWRfcGFja2VkKHN0cnVjdCB2
aXJ0cXVldWUgKl92cSkKPiA+ICB7Cj4gPiAgICAgICAgIHN0cnVjdCB2cmluZ192aXJ0cXVldWUg
KnZxID0gdG9fdnZxKF92cSk7Cj4gPiAtICAgICAgIHUxNiB1c2VkX2lkeCwgd3JhcF9jb3VudGVy
Owo+ID4gKyAgICAgICB1MTYgdXNlZF9pZHgsIHdyYXBfY291bnRlciwgbGFzdF91c2VkX2lkeDsK
PiA+ICAgICAgICAgdTE2IGJ1ZnM7Cj4gPgo+ID4gICAgICAgICBTVEFSVF9VU0UodnEpOwo+ID4g
QEAgLTE1NTAsOSArMTU2OCwxMCBAQCBzdGF0aWMgYm9vbCB2aXJ0cXVldWVfZW5hYmxlX2NiX2Rl
bGF5ZWRfcGFja2VkKHN0cnVjdCB2aXJ0cXVldWUgKl92cSkKPiA+ICAgICAgICAgaWYgKHZxLT5l
dmVudCkgewo+ID4gICAgICAgICAgICAgICAgIC8qIFRPRE86IHR1bmUgdGhpcyB0aHJlc2hvbGQg
Ki8KPiA+ICAgICAgICAgICAgICAgICBidWZzID0gKHZxLT5wYWNrZWQudnJpbmcubnVtIC0gdnEt
PnZxLm51bV9mcmVlKSAqIDMgLyA0Owo+ID4gLSAgICAgICAgICAgICAgIHdyYXBfY291bnRlciA9
IHZxLT5wYWNrZWQudXNlZF93cmFwX2NvdW50ZXI7Cj4gPiArICAgICAgICAgICAgICAgbGFzdF91
c2VkX2lkeCA9IFJFQURfT05DRSh2cS0+bGFzdF91c2VkX2lkeCk7Cj4gPiArICAgICAgICAgICAg
ICAgd3JhcF9jb3VudGVyID0gcGFja2VkX3VzZWRfd3JhcF9jb3VudGVyKGxhc3RfdXNlZF9pZHgp
Owo+ID4KPiA+IC0gICAgICAgICAgICAgICB1c2VkX2lkeCA9IHZxLT5sYXN0X3VzZWRfaWR4ICsg
YnVmczsKPiA+ICsgICAgICAgICAgICAgICB1c2VkX2lkeCA9IHBhY2tlZF9sYXN0X3VzZWQobGFz
dF91c2VkX2lkeCkgKyBidWZzOwo+ID4gICAgICAgICAgICAgICAgIGlmICh1c2VkX2lkeCA+PSB2
cS0+cGFja2VkLnZyaW5nLm51bSkgewo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgdXNlZF9p
ZHggLT0gdnEtPnBhY2tlZC52cmluZy5udW07Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICB3
cmFwX2NvdW50ZXIgXj0gMTsKPiA+IEBAIC0xNTgyLDkgKzE2MDEsMTAgQEAgc3RhdGljIGJvb2wg
dmlydHF1ZXVlX2VuYWJsZV9jYl9kZWxheWVkX3BhY2tlZChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEp
Cj4gPiAgICAgICAgICAqLwo+ID4gICAgICAgICB2aXJ0aW9fbWIodnEtPndlYWtfYmFycmllcnMp
Owo+ID4KPiA+IC0gICAgICAgaWYgKGlzX3VzZWRfZGVzY19wYWNrZWQodnEsCj4gPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHZxLT5sYXN0X3VzZWRfaWR4LAo+ID4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB2cS0+cGFja2VkLnVzZWRfd3JhcF9jb3VudGVyKSkgewo+
ID4gKyAgICAgICBsYXN0X3VzZWRfaWR4ID0gUkVBRF9PTkNFKHZxLT5sYXN0X3VzZWRfaWR4KTsK
PiA+ICsgICAgICAgd3JhcF9jb3VudGVyID0gcGFja2VkX3VzZWRfd3JhcF9jb3VudGVyKGxhc3Rf
dXNlZF9pZHgpOwo+ID4gKyAgICAgICB1c2VkX2lkeCA9IHBhY2tlZF9sYXN0X3VzZWQobGFzdF91
c2VkX2lkeCk7Cj4gPiArICAgICAgIGlmIChpc191c2VkX2Rlc2NfcGFja2VkKHZxLCB1c2VkX2lk
eCwgd3JhcF9jb3VudGVyKSkgewo+ID4gICAgICAgICAgICAgICAgIEVORF9VU0UodnEpOwo+ID4g
ICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+ICAgICAgICAgfQo+ID4gQEAgLTE2ODks
NyArMTcwOSw3IEBAIHN0YXRpYyBzdHJ1Y3QgdmlydHF1ZXVlICp2cmluZ19jcmVhdGVfdmlydHF1
ZXVlX3BhY2tlZCgKPiA+ICAgICAgICAgdnEtPm5vdGlmeSA9IG5vdGlmeTsKPiA+ICAgICAgICAg
dnEtPndlYWtfYmFycmllcnMgPSB3ZWFrX2JhcnJpZXJzOwo+ID4gICAgICAgICB2cS0+YnJva2Vu
ID0gdHJ1ZTsKPiA+IC0gICAgICAgdnEtPmxhc3RfdXNlZF9pZHggPSAwOwo+ID4gKyAgICAgICB2
cS0+bGFzdF91c2VkX2lkeCA9IDAgfCAoMSA8PCBWUklOR19QQUNLRURfRVZFTlRfRl9XUkFQX0NU
Uik7Cj4gPiAgICAgICAgIHZxLT5ldmVudF90cmlnZ2VyZWQgPSBmYWxzZTsKPiA+ICAgICAgICAg
dnEtPm51bV9hZGRlZCA9IDA7Cj4gPiAgICAgICAgIHZxLT5wYWNrZWRfcmluZyA9IHRydWU7Cj4g
PiBAQCAtMTcyMCw3ICsxNzQwLDYgQEAgc3RhdGljIHN0cnVjdCB2aXJ0cXVldWUgKnZyaW5nX2Ny
ZWF0ZV92aXJ0cXVldWVfcGFja2VkKAo+ID4KPiA+ICAgICAgICAgdnEtPnBhY2tlZC5uZXh0X2F2
YWlsX2lkeCA9IDA7Cj4gPiAgICAgICAgIHZxLT5wYWNrZWQuYXZhaWxfd3JhcF9jb3VudGVyID0g
MTsKPiA+IC0gICAgICAgdnEtPnBhY2tlZC51c2VkX3dyYXBfY291bnRlciA9IDE7Cj4gPiAgICAg
ICAgIHZxLT5wYWNrZWQuZXZlbnRfZmxhZ3Nfc2hhZG93ID0gMDsKPiA+ICAgICAgICAgdnEtPnBh
Y2tlZC5hdmFpbF91c2VkX2ZsYWdzID0gMSA8PCBWUklOR19QQUNLRURfREVTQ19GX0FWQUlMOwo+
ID4KPiA+IC0tCj4gPiAyLjMxLjEKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRp
b25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRp
b24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
