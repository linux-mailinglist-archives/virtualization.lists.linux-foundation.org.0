Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 692001EC996
	for <lists.virtualization@lfdr.de>; Wed,  3 Jun 2020 08:35:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 77CDC869A9;
	Wed,  3 Jun 2020 06:35:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZHFBZLICXg4Q; Wed,  3 Jun 2020 06:35:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 52DAB86911;
	Wed,  3 Jun 2020 06:35:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0AC72C016E;
	Wed,  3 Jun 2020 06:35:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 728A0C016E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 06:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6EDB088703
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 06:35:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GIpQOgvJxNiE
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 06:35:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1EA3A886FC
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 06:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591166103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B2vN8Dw/qz4vI/EzjgMHSYDUd1pSEefI0GYoGuUtsDQ=;
 b=byMhuBxvmb57bXzHGaUKuus0bpJD2sAMcmIsOUk6IlXQYHXVL3hEUSGPBNIMP+haplfzOZ
 m2xmYxyFrbTSmFqquae4Ia+clSXwMKRITxCZmTGYI1vh43EewVCs0AjVEbCUiBpATvR5Vu
 ULGG4ceHAyTGQfY/AR1YVCfmlRaRy5I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-OosDl2S0NVGWWGLxYvP7dA-1; Wed, 03 Jun 2020 02:35:00 -0400
X-MC-Unique: OosDl2S0NVGWWGLxYvP7dA-1
Received: by mail-wr1-f69.google.com with SMTP id e7so667876wrp.14
 for <virtualization@lists.linux-foundation.org>;
 Tue, 02 Jun 2020 23:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=B2vN8Dw/qz4vI/EzjgMHSYDUd1pSEefI0GYoGuUtsDQ=;
 b=o7h04SqcmktUFYrLCLodfEyBfSiRjMveHSCUJCoTNFG3LnKTn+f9j910sU6Qe6nk/n
 f1STsXQK2yrd1Sxx0l2n31Kf5w6AOJKy/TvPaNUmOQUcaaWSRdRk5Tx+tbN1p3dTjBtx
 VJ9Ae+FVEnQTSrhqwBqEEA1fJyP404U8KMUL8np4bE6N4JftOvg3wBwhStcA7Q/STauL
 9BlDHZOr4NeMSOLwvzFexnJq4pxjH3Zl0cY8/1UJup+stjP4BXHOODM1b9+7VbYRkts7
 8Vv51nRvkj0PZVeX+nyXARojR2GIP/mub6X2PkIE1YonCkU/amaYhIOQelBGtx2hTSao
 q8sA==
X-Gm-Message-State: AOAM531DGKb+Z5AQdGDUm71cL8zEoszTjTB9eGBimMFZiDFhWP5EEZfu
 PyowhukcwWRk0k1Rq7RDe7oki50fTUkIBwu/YgfjqI94o0Qlr+LExSxJedRieOrYGp4a78u2GBD
 +G1+yeZw78zGNq/yTZIbdjq6+c+jyRbUQjgZRW1BIaw==
X-Received: by 2002:a5d:55c2:: with SMTP id i2mr2298376wrw.225.1591166098335; 
 Tue, 02 Jun 2020 23:34:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxI/UQ1e2IEFfNgnSn57m0Bfm86YlMkYesjj021UABMgsR+tPWUtN6rPFfKqgucl2vmU6mZTg==
X-Received: by 2002:a5d:55c2:: with SMTP id i2mr2298360wrw.225.1591166098131; 
 Tue, 02 Jun 2020 23:34:58 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 z16sm1734703wrm.70.2020.06.02.23.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 23:34:57 -0700 (PDT)
Date: Wed, 3 Jun 2020 02:34:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 4/6] vhost_vdpa: support doorbell mapping via mmap
Message-ID: <20200603023429-mutt-send-email-mst@kernel.org>
References: <20200529080303.15449-5-jasowang@redhat.com>
 <202006020308.kLXTHt4n%lkp@intel.com>
 <20200602005007-mutt-send-email-mst@kernel.org>
 <bd7dde11-b726-ee08-4e80-71fb784fa549@redhat.com>
 <20200602093025-mutt-send-email-mst@kernel.org>
 <5db6b413-cb6c-a566-2f2d-ad580d8e165b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5db6b413-cb6c-a566-2f2d-ad580d8e165b@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kbuild-all@lists.01.org, kbuild test robot <lkp@intel.com>,
 kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 lingshan.zhu@intel.com, lulu@redhat.com, rob.miller@broadcom.com
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

T24gV2VkLCBKdW4gMDMsIDIwMjAgYXQgMTI6MTg6NDRQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzYvMiDkuIvljYg5OjMxLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
Cj4gPiBPbiBUdWUsIEp1biAwMiwgMjAyMCBhdCAwMjo0OTozOFBNICswODAwLCBKYXNvbiBXYW5n
IHdyb3RlOgo+ID4gPiBPbiAyMDIwLzYvMiDkuIvljYgxMjo1NiwgTWljaGFlbCBTLiBUc2lya2lu
IHdyb3RlOgo+ID4gPiA+IE9uIFR1ZSwgSnVuIDAyLCAyMDIwIGF0IDAzOjIyOjQ5QU0gKzA4MDAs
IGtidWlsZCB0ZXN0IHJvYm90IHdyb3RlOgo+ID4gPiA+ID4gSGkgSmFzb24sCj4gPiA+ID4gPiAK
PiA+ID4gPiA+IEkgbG92ZSB5b3VyIHBhdGNoISBZZXQgc29tZXRoaW5nIHRvIGltcHJvdmU6Cj4g
PiA+ID4gPiAKPiA+ID4gPiA+IFthdXRvIGJ1aWxkIHRlc3QgRVJST1Igb24gdmhvc3QvbGludXgt
bmV4dF0KPiA+ID4gPiA+IFthbHNvIGJ1aWxkIHRlc3QgRVJST1Igb24gbGludXMvbWFzdGVyIHY1
LjcgbmV4dC0yMDIwMDUyOV0KPiA+ID4gPiA+IFtpZiB5b3VyIHBhdGNoIGlzIGFwcGxpZWQgdG8g
dGhlIHdyb25nIGdpdCB0cmVlLCBwbGVhc2UgZHJvcCB1cyBhIG5vdGUgdG8gaGVscAo+ID4gPiA+
ID4gaW1wcm92ZSB0aGUgc3lzdGVtLiBCVFcsIHdlIGFsc28gc3VnZ2VzdCB0byB1c2UgJy0tYmFz
ZScgb3B0aW9uIHRvIHNwZWNpZnkgdGhlCj4gPiA+ID4gPiBiYXNlIHRyZWUgaW4gZ2l0IGZvcm1h
dC1wYXRjaCwgcGxlYXNlIHNlZWh0dHBzOi8vc3RhY2tvdmVyZmxvdy5jb20vYS8zNzQwNjk4Ml0K
PiA+ID4gPiA+IAo+ID4gPiA+ID4gdXJsOmh0dHBzOi8vZ2l0aHViLmNvbS8wZGF5LWNpL2xpbnV4
L2NvbW1pdHMvSmFzb24tV2FuZy92RFBBLWRvb3JiZWxsLW1hcHBpbmcvMjAyMDA1MzEtMDcwODM0
Cj4gPiA+ID4gPiBiYXNlOmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L21zdC92aG9zdC5naXQgIGxpbnV4LW5leHQKPiA+ID4gPiA+IGNvbmZpZzogbTY4ay1y
YW5kY29uZmlnLXIwMTEtMjAyMDA2MDEgKGF0dGFjaGVkIGFzIC5jb25maWcpCj4gPiA+ID4gPiBj
b21waWxlcjogbTY4ay1saW51eC1nY2MgKEdDQykgOS4zLjAKPiA+ID4gPiA+IHJlcHJvZHVjZSAo
dGhpcyBpcyBhIFc9MSBidWlsZCk6Cj4gPiA+ID4gPiAgICAgICAgICAgd2dldGh0dHBzOi8vcmF3
LmdpdGh1YnVzZXJjb250ZW50LmNvbS9pbnRlbC9sa3AtdGVzdHMvbWFzdGVyL3NiaW4vbWFrZS5j
cm9zcyAgLU8gfi9iaW4vbWFrZS5jcm9zcwo+ID4gPiA+ID4gICAgICAgICAgIGNobW9kICt4IH4v
YmluL21ha2UuY3Jvc3MKPiA+ID4gPiA+ICAgICAgICAgICAjIHNhdmUgdGhlIGF0dGFjaGVkIC5j
b25maWcgdG8gbGludXggYnVpbGQgdHJlZQo+ID4gPiA+ID4gICAgICAgICAgIENPTVBJTEVSX0lO
U1RBTExfUEFUSD0kSE9NRS8wZGF5IENPTVBJTEVSPWdjYy05LjMuMCBtYWtlLmNyb3NzIEFSQ0g9
bTY4awo+ID4gPiA+ID4gCj4gPiA+ID4gPiBJZiB5b3UgZml4IHRoZSBpc3N1ZSwga2luZGx5IGFk
ZCBmb2xsb3dpbmcgdGFnIGFzIGFwcHJvcHJpYXRlCj4gPiA+ID4gPiBSZXBvcnRlZC1ieToga2J1
aWxkIHRlc3Qgcm9ib3Q8bGtwQGludGVsLmNvbT4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gQWxsIGVy
cm9ycyAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4sIG9sZCBvbmVzIHByZWZpeGVkIGJ5IDw8KToK
PiA+ID4gPiA+IAo+ID4gPiA+ID4gZHJpdmVycy92aG9zdC92ZHBhLmM6IEluIGZ1bmN0aW9uICd2
aG9zdF92ZHBhX2ZhdWx0JzoKPiA+ID4gPiA+ID4gPiBkcml2ZXJzL3Zob3N0L3ZkcGEuYzo3NTQ6
MjI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAncGdwcm90X25vbmNh
Y2hlZCcgWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gPiA+ID4gPiA3
NTQgfCAgdm1hLT52bV9wYWdlX3Byb3QgPSBwZ3Byb3Rfbm9uY2FjaGVkKHZtYS0+dm1fcGFnZV9w
cm90KTsKPiA+ID4gPiA+IHwgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fgo+
ID4gPiA+ID4gPiA+IGRyaXZlcnMvdmhvc3QvdmRwYS5jOjc1NDoyMjogZXJyb3I6IGluY29tcGF0
aWJsZSB0eXBlcyB3aGVuIGFzc2lnbmluZyB0byB0eXBlICdwZ3Byb3RfdCcge2FrYSAnc3RydWN0
IDxhbm9ueW1vdXM+J30gZnJvbSB0eXBlICdpbnQnCj4gPiA+ID4gPiBjYzE6IHNvbWUgd2Fybmlu
Z3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKPiA+ID4gPiA+IAo+ID4gPiA+ID4gdmltICsvcGdw
cm90X25vbmNhY2hlZCArNzU0IGRyaXZlcnMvdmhvc3QvdmRwYS5jCj4gPiA+ID4gPiAKPiA+ID4g
PiA+ICAgICAgNzQyCQo+ID4gPiA+ID4gICAgICA3NDMJc3RhdGljIHZtX2ZhdWx0X3Qgdmhvc3Rf
dmRwYV9mYXVsdChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKPiA+ID4gPiA+ICAgICAgNzQ0CXsKPiA+
ID4gPiA+ICAgICAgNzQ1CQlzdHJ1Y3Qgdmhvc3RfdmRwYSAqdiA9IHZtZi0+dm1hLT52bV9maWxl
LT5wcml2YXRlX2RhdGE7Cj4gPiA+ID4gPiAgICAgIDc0NgkJc3RydWN0IHZkcGFfZGV2aWNlICp2
ZHBhID0gdi0+dmRwYTsKPiA+ID4gPiA+ICAgICAgNzQ3CQljb25zdCBzdHJ1Y3QgdmRwYV9jb25m
aWdfb3BzICpvcHMgPSB2ZHBhLT5jb25maWc7Cj4gPiA+ID4gPiAgICAgIDc0OAkJc3RydWN0IHZk
cGFfbm90aWZpY2F0aW9uX2FyZWEgbm90aWZ5Owo+ID4gPiA+ID4gICAgICA3NDkJCXN0cnVjdCB2
bV9hcmVhX3N0cnVjdCAqdm1hID0gdm1mLT52bWE7Cj4gPiA+ID4gPiAgICAgIDc1MAkJdTE2IGlu
ZGV4ID0gdm1hLT52bV9wZ29mZjsKPiA+ID4gPiA+ICAgICAgNzUxCQo+ID4gPiA+ID4gICAgICA3
NTIJCW5vdGlmeSA9IG9wcy0+Z2V0X3ZxX25vdGlmaWNhdGlvbih2ZHBhLCBpbmRleCk7Cj4gPiA+
ID4gPiAgICAgIDc1MwkKPiA+ID4gPiA+ICAgID4gNzU0CQl2bWEtPnZtX3BhZ2VfcHJvdCA9IHBn
cHJvdF9ub25jYWNoZWQodm1hLT52bV9wYWdlX3Byb3QpOwo+ID4gPiA+ID4gICAgICA3NTUJCWlm
IChyZW1hcF9wZm5fcmFuZ2Uodm1hLCB2bWYtPmFkZHJlc3MgJiBQQUdFX01BU0ssCj4gPiA+ID4g
PiAgICAgIDc1NgkJCQkgICAgbm90aWZ5LmFkZHIgPj4gUEFHRV9TSElGVCwgUEFHRV9TSVpFLAo+
ID4gPiA+ID4gICAgICA3NTcJCQkJICAgIHZtYS0+dm1fcGFnZV9wcm90KSkKPiA+ID4gPiA+ICAg
ICAgNzU4CQkJcmV0dXJuIFZNX0ZBVUxUX1NJR0JVUzsKPiA+ID4gPiA+ICAgICAgNzU5CQo+ID4g
PiA+ID4gICAgICA3NjAJCXJldHVybiBWTV9GQVVMVF9OT1BBR0U7Cj4gPiA+ID4gPiAgICAgIDc2
MQl9Cj4gPiA+ID4gPiAgICAgIDc2MgkKPiA+ID4gPiBZZXMgd2VsbCwgYWxsIHRoaXMgcmVtYXBw
aW5nIGNsZWFybHkgaGFzIG5vIGNoYW5jZSB0byB3b3JrCj4gPiA+ID4gb24gc3lzdGVtcyB3aXRo
b3V0IENPTkZJR19NTVUuCj4gPiA+IAo+ID4gPiBJdCBsb29rcyB0byBtZSBtbWFwIGNhbiB3b3Jr
IGFjY29yZGluZyB0byBEb2N1bWVudGF0aW9uL25vbW11LW1tYXAudHh0LiBCdXQKPiA+ID4gSSdt
IG5vdCBzdXJlIGl0J3Mgd29ydGggdG8gYm90aGVyLgo+ID4gPiAKPiA+ID4gVGhhbmtzCj4gPiAK
PiA+IFdlbGwKPiA+IAo+ID4gaW50IHJlbWFwX3Bmbl9yYW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBhZGRyLAo+ID4gICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBsb25nIHBmbiwgdW5zaWduZWQgbG9uZyBzaXplLCBwZ3Byb3RfdCBwcm90KQo+ID4gewo+ID4g
ICAgICAgICAgaWYgKGFkZHIgIT0gKHBmbiA8PCBQQUdFX1NISUZUKSkKPiA+ICAgICAgICAgICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiAKPiA+ICAgICAgICAgIHZtYS0+dm1fZmxhZ3MgfD0g
Vk1fSU8gfCBWTV9QRk5NQVAgfCBWTV9ET05URVhQQU5EIHwgVk1fRE9OVERVTVA7Cj4gPiAgICAg
ICAgICByZXR1cm4gMDsKPiA+IH0KPiA+IEVYUE9SVF9TWU1CT0wocmVtYXBfcGZuX3JhbmdlKTsK
PiA+IAo+ID4gCj4gPiBTbyB0aGluZ3MgYXJlbid0IGdvaW5nIHRvIHdvcmsgaWYgeW91IGhhdmUg
YSBmaXhlZCBQRk4KPiA+IHdoaWNoIGlzIHRoZSBjYXNlIG9mIHRoZSBoYXJkd2FyZSBkZXZpY2Uu
Cj4gCj4gCj4gTG9va2luZyBhdCB0aGUgaW1wbGVtZW50YXRpb24gb2Ygc29tZSBkcml2ZXJzIGUu
ZyBtdGRfY2hhci4gSWYgSSByZWFkIHRoZQo+IGNvZGUgY29ycmVjdGx5LCB3ZSBjYW4gZG8gdGhp
cyBieSBwcm92aWRpbmcgZ2V0X3VubWFwcGVkX2FyZWEgbWV0aG9kIGFuZCB1c2UKPiBwaHlzaWNh
bCBhZGRyZXNzIGRpcmVjdGx5Lgo+IAo+IEJ1dCBzdGFydCBmb3JtIENPTkZJR19NTVUgc2hvdWxk
IGJlIGZpbmUuwqAgRG8geW91IHByZWZlciBtYWtpbmcgdmhvc3RfdmRwYQo+IGRlcGVuZHMgb24g
Q09ORklHX01NVSBvciBqdXN0IGZhaWwgbW1hcCB3aGVuIENPTkZJR19NTVUgaXMgbm90IGNvbmZp
Z3VyZWQ/Cj4gCj4gVGhhbmtzCgpJJ2QganVzdCBub3Qgc3BlY2lmeSB0aGUgbW1hcCBjYWxsYmFj
ayBhdCBhbGwuCgo+IAo+ID4gCj4gPiAKPiA+ID4gPiAKPiA+ID4gPiAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
