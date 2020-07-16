Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF22221C74
	for <lists.virtualization@lfdr.de>; Thu, 16 Jul 2020 08:15:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 59D988909A;
	Thu, 16 Jul 2020 06:15:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GYMccfQxlo+V; Thu, 16 Jul 2020 06:15:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A6E6B890A0;
	Thu, 16 Jul 2020 06:15:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95A98C0733;
	Thu, 16 Jul 2020 06:15:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C4D0C0733
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 06:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 34450890A0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 06:15:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hQhh9j5tOGn4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 06:15:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 188C88909A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 06:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594880130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M4FS4yzYrjpQnMFv5QUa2bTajd8sHiv/1qfXLXjqecQ=;
 b=X9Z6/m/eP45xHAT+IuJ3kHm+p8wAXxDFY2ekpVhTEOPKvWWoskB+gNdg7iD+8H2YgrMNX1
 2rG07YyQSMp88cGVZwehoUWQh3E+OmCCVI22HPymDOSVplc6MUQcAwBCuFmsjU0yBK7FiZ
 jqz83ibxDYgbM7i5IEGhqOseUbwhyYI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-NuHiMOxmPgujTPTSEUZDBA-1; Thu, 16 Jul 2020 02:15:28 -0400
X-MC-Unique: NuHiMOxmPgujTPTSEUZDBA-1
Received: by mail-wm1-f69.google.com with SMTP id c81so4141376wmd.2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 23:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=M4FS4yzYrjpQnMFv5QUa2bTajd8sHiv/1qfXLXjqecQ=;
 b=EAbHWKYz50abMHrb5WzjOBQet0HbkiFagaw3dxU893ohtBoVi0rL/MIvx/CKuKUNE3
 NoFA9ippYaD4Pltx2tRuk7xXBEECqlSBn68CDM4UndbX3eWEmna6K4dKbGL8wTrAfMWN
 RH3zpBLIi8B7Sn/hBj5iDccoDvZk4YyezxDKNx5gscdv/EnGHMtN1D8VUrGjr5IgSn5h
 tKt0A5Rlyk4KMwZfewqEEcN7LLVRbJuNAtF4r7Q9/qvR2B6oxck2RU15Ov7ElR6edhAO
 VUval56VWuB24A7+rNGhRE3+fwPC+ka8+jZTlKEXOdPvJcM8awydB60/nDb1aD74jT0j
 +qfQ==
X-Gm-Message-State: AOAM532XMFqdkQa4EY4q9yU5lFYnfvJXO6DQaohQmq0Y0Uc8NqThpt5S
 I4bHgtQ24WYZZtJNR6Vy4ex9csOavoj5tcDYLksUdV+F3s8FIi6VXNpVqVo/wODitrDu6LWzSYX
 wa4oBzjNn6310x0S9ucNxo+ZQ/oHho++uuC/wGCNstQ==
X-Received: by 2002:adf:cc85:: with SMTP id p5mr3315905wrj.273.1594880127877; 
 Wed, 15 Jul 2020 23:15:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpXKQQdIeqinuWsERGiaLq/STljNJxBfiy4+NiiUehwjdb/coh4z5EcaCuvTh+krGRLDMqrA==
X-Received: by 2002:adf:cc85:: with SMTP id p5mr3315877wrj.273.1594880127633; 
 Wed, 15 Jul 2020 23:15:27 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 l67sm7715417wml.13.2020.07.15.23.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 23:15:26 -0700 (PDT)
Date: Thu, 16 Jul 2020 02:15:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 0/7] *** IRQ offloading for vDPA ***
Message-ID: <20200716021435-mutt-send-email-mst@kernel.org>
References: <1594565524-3394-1-git-send-email-lingshan.zhu@intel.com>
 <70244d80-08a4-da91-3226-7bfd2019467e@redhat.com>
 <97032c51-3265-c94a-9ce1-f42fcc6d3075@intel.com>
 <77318609-85ef-f169-2a1e-500473976d84@redhat.com>
 <29ab6da8-ed8e-6b91-d658-f3d240543b29@intel.com>
 <1e91d9dd-d787-beff-2c14-9c76ffc3b285@redhat.com>
 <a319cba3-8b3d-8968-0fb7-48a1d34042bf@intel.com>
 <67c4c41d-9e95-2270-4acb-6f04668c34fa@redhat.com>
MIME-Version: 1.0
In-Reply-To: <67c4c41d-9e95-2270-4acb-6f04668c34fa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: wanpengli@tencent.com, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 sean.j.christopherson@intel.com,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, pbonzini@redhat.com, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>
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

T24gVGh1LCBKdWwgMTYsIDIwMjAgYXQgMTI6MjA6MDlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzcvMTYg5LiL5Y2IMTI6MTMsIFpodSwgTGluZ3NoYW4gd3JvdGU6Cj4g
PiAKPiA+IAo+ID4gT24gNy8xNi8yMDIwIDEyOjAyIFBNLCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4g
PiAKPiA+ID4gT24gMjAyMC83LzE2IOS4iuWNiDExOjU5LCBaaHUsIExpbmdzaGFuIHdyb3RlOgo+
ID4gPiA+IAo+ID4gPiA+IE9uIDcvMTYvMjAyMCAxMDo1OSBBTSwgSmFzb24gV2FuZyB3cm90ZToK
PiA+ID4gPiA+IAo+ID4gPiA+ID4gT24gMjAyMC83LzE2IOS4iuWNiDk6MzksIFpodSwgTGluZ3No
YW4gd3JvdGU6Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gT24gNy8xNS8y
MDIwIDk6NDMgUE0sIEphc29uIFdhbmcgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+
ID4gT24gMjAyMC83LzEyIOS4i+WNiDEwOjUyLCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4gPiA+ID4g
PiA+ID4gPiBIaSBBbGwsCj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IFRoaXMgc2Vy
aWVzIGludGVuZHMgdG8gaW1wbGVtZW50IElSUSBvZmZsb2FkaW5nIGZvcgo+ID4gPiA+ID4gPiA+
ID4gdmhvc3RfdmRwYS4KPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gQnkgdGhlIGZl
YXQgb2YgaXJxIGZvcndhcmRpbmcgZmFjaWxpdGllcyBsaWtlIHBvc3RlZAo+ID4gPiA+ID4gPiA+
ID4gaW50ZXJydXB0IG9uIFg4NiwgaXJxIGJ5cGFzcyBjYW7CoCBoZWxwIGRlbGl2ZXIKPiA+ID4g
PiA+ID4gPiA+IGludGVycnVwdHMgdG8gdkNQVSBkaXJlY3RseS4KPiA+ID4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiA+ID4gdkRQQSBkZXZpY2VzIGhhdmUgZGVkaWNhdGVkIGhhcmR3YXJlIGJhY2tl
bmRzIGxpa2UgVkZJTwo+ID4gPiA+ID4gPiA+ID4gcGFzcy10aHJvdWdoZWQgZGV2aWNlcy4gU28g
aXQgd291bGQgYmUgcG9zc2libGUgdG8gc2V0dXAKPiA+ID4gPiA+ID4gPiA+IGlycSBvZmZsb2Fk
aW5nKGlycSBieXBhc3MpIGZvciB2RFBBIGRldmljZXMgYW5kIGdhaW4KPiA+ID4gPiA+ID4gPiA+
IHBlcmZvcm1hbmNlIGltcHJvdmVtZW50cy4KPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+
ID4gSW4gbXkgdGVzdGluZywgd2l0aCB0aGlzIGZlYXR1cmUsIHdlIGNhbiBzYXZlIDAuMW1zCj4g
PiA+ID4gPiA+ID4gPiBpbiBhIHBpbmcgYmV0d2VlbiB0d28gVkZzIG9uIGF2ZXJhZ2UuCj4gPiA+
ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gSGkgTGluZ3NoYW46Cj4gPiA+
ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gRHVyaW5nIHRoZSB2aXJ0aW8tbmV0d29ya2luZyBtZWV0
aW5nLCBNaWNoYWVsIHNwb3RzCj4gPiA+ID4gPiA+ID4gdHdvIHBvc3NpYmxlIGlzc3VlczoKPiA+
ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiAxKSBkbyB3ZSBuZWVkIGFuIG5ldyB1QVBJIHRvIHN0
b3AgdGhlIGlycSBvZmZsb2FkaW5nPwo+ID4gPiA+ID4gPiA+IDIpIGNhbiBpbnRlcnJ1cHQgbG9z
dCBkdXJpbmcgdGhlIGV2ZW50ZmQgY3R4Pwo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IEZv
ciAxKSBJIHRoaW5rIHdlIHByb2JhYmx5IG5vdCwgd2UgY2FuIGFsbG9jYXRlIGFuCj4gPiA+ID4g
PiA+ID4gaW5kZXBlbmRlbnQgZXZlbnRmZCB3aGljaCBkb2VzIG5vdCBtYXAgdG8gTVNJWC4gU28K
PiA+ID4gPiA+ID4gPiB0aGUgY29uc3VtZXIgY2FuJ3QgbWF0Y2ggdGhlIHByb2R1Y2VyIGFuZCB3
ZQo+ID4gPiA+ID4gPiA+IGZhbGxiYWNrIHRvIGV2ZW50ZmQgYmFzZWQgaXJxLgo+ID4gPiA+ID4g
PiBIaSBKYXNvbiwKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEkgd29uZGVyIHdoeSB3ZSBuZWVk
IHRvIHN0b3AgaXJxIG9mZmxvYWRpbmcsIGJ1dCBpZiB3ZQo+ID4gPiA+ID4gPiBuZWVkIHRvIGRv
IHNvLCBtYXliZSBhIG5ldyB1QVBJIHdvdWxkIGJlIG1vcmUgaW50dWl0aXZlCj4gPiA+ID4gPiA+
IHRvIG1lLAo+ID4gPiA+ID4gPiBidXQgd2h5IGFuZCB3aG8odXNlcj8gcWVtdT8pIHNoYWxsIGlu
aXRpYWxpemUgdGhpcwo+ID4gPiA+ID4gPiBwcm9jZXNzLCBiYXNlZCBvbiB3aGF0IGtpbmRhIG9m
IGJhc2lzIHRvIG1ha2UgdGhlCj4gPiA+ID4gPiA+IGRlY2lzaW9uPwo+ID4gPiA+ID4gCj4gPiA+
ID4gPiAKPiA+ID4gPiA+IFRoZSByZWFzb24gaXMgd2UgbWF5IHdhbnQgdG8gZmFsbGJhY2sgdG8g
c29mdHdhcmUgZGF0YXBhdGgKPiA+ID4gPiA+IGZvciBzb21lIHJlYXNvbiAoZS5nIHNvZnR3YXJl
IGFzc2lzdGVkIGxpdmUgbWlncmF0aW9uKS4gSW4KPiA+ID4gPiA+IHRoaXMgY2FzZSB3ZSBuZWVk
IGludGVyY2VwdCBkZXZpY2Ugd3JpdGUgdG8gdXNlZCByaW5nIHNvIHdlCj4gPiA+ID4gPiBjYW4g
bm90IG9mZmxvYWRpbmcgdmlydHF1ZXVlIGludGVycnVwdCBpbiB0aGlzIGNhc2UuCj4gPiA+ID4g
c28gYWRkIGEgVkhPU1RfVkRQQV9TVE9QX0lSUV9PRkZMT0FESU5HPyBUaGVuIGRvIHdlIG5lZWQg
YQo+ID4gPiA+IFZIT1NUX1ZEUEFfU1RBUlRfSVJRX09GRkxPQURJTkcsIHRoZW4gbGV0IHVzZXJz
cGFjZSBmdWxseQo+ID4gPiA+IGNvbnRyb2wgdGhpcz8gT3IgYW55IGJldHRlciBhcHByb2FjaGVz
Pwo+ID4gPiAKPiA+ID4gCj4gPiA+IFByb2JhYmx5IG5vdCwgaXQncyBhcyBzaW1wbGUgYXMgYWxs
b2NhdGluZyBhbm90aGVyIGV2ZW50ZmQgKGJ1dCBub3QKPiA+ID4gaXJxZmQpLCBhbmQgcGFzcyBp
dCB0byB2aG9zdC12ZHBhLiBUaGVuIHRoZSBvZmZsb2FkaW5nIGlzIGRpc2FibGVkCj4gPiA+IHNp
bmNlIGl0IGRvZXNuJ3QgaGF2ZSBhIGNvbnN1bWVyLgo+ID4gT0ssIHNvdW5kcyBsaWtlIFFFTVUg
d29yaywgbm8gbmVlZCB0byB0YWtlIGNhcmUgaW4gdGhpcyBzZXJpZXMsIHJpZ2h0Pwo+IAo+IAo+
IFRoYXQncyBteSB1bmRlcnN0YW5kaW5nLgo+IAo+IFRoYW5rcwoKTGV0J3MgY29uZmlybSBhIHN3
aXRjaCBoYXBwZW5zIGF0b21pY2FsbHkgc28gZWFjaCBpbnRlcnJ1cHQKaXMgc2VudCBlaXRoZXIg
dG8gZXZlbnRmZCB0byBndWVzdCBkaXJlY3RseSB0aG91Z2guCgo+IAo+ID4gCj4gPiBUaGFua3Ms
Cj4gPiBCUgo+ID4gWmh1IExpbmdzaGFuCj4gPiA+IAo+ID4gPiBUaGFua3MKPiA+ID4gCj4gPiA+
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVh
bGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3ZpcnR1YWxpemF0aW9u
