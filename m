Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B581C17E1
	for <lists.virtualization@lfdr.de>; Fri,  1 May 2020 16:37:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6350987A59;
	Fri,  1 May 2020 14:37:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lUw3tO8IFkRu; Fri,  1 May 2020 14:37:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 543CB87A55;
	Fri,  1 May 2020 14:37:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C4F2C016F;
	Fri,  1 May 2020 14:37:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE446C016F
 for <virtualization@lists.linux-foundation.org>;
 Fri,  1 May 2020 14:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C580820C41
 for <virtualization@lists.linux-foundation.org>;
 Fri,  1 May 2020 14:37:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uebq8eeKo65p
 for <virtualization@lists.linux-foundation.org>;
 Fri,  1 May 2020 14:37:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id F2F472076B
 for <virtualization@lists.linux-foundation.org>;
 Fri,  1 May 2020 14:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588343845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+pSfuYwc07hQQ9dsDKJcYfTJmTKhIXhBIr9mDnsaJ8=;
 b=SOZnImqGkuaYBRIwwm3LtXW+UbBy/hXHl9brcumD1p5KJdRl77GoAmk59lfBJrE31zxQ+N
 ixlT3XcSdMJx+gpAcl6hPN4iOfTm4mklw4kOp3zOT8ETNfZShBoEdjtO4zRPQdkiFbvDgh
 iGfuvBEOPGpmlgcUvB4+kJLW1T5g5mE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-8fjxij0XO9SvfBfvFO9tYA-1; Fri, 01 May 2020 10:37:21 -0400
X-MC-Unique: 8fjxij0XO9SvfBfvFO9tYA-1
Received: by mail-wm1-f69.google.com with SMTP id n17so2120625wmi.3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 01 May 2020 07:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=I+pSfuYwc07hQQ9dsDKJcYfTJmTKhIXhBIr9mDnsaJ8=;
 b=JLkLmKcYlmhT+rPxnqeIh7x2L3S56bj2i5lCgAxj4GszVhdaZcEGEShbsnACnqp/Zq
 r4wntoJc3kxb94i01VwZTbndyRt72UL42SgDueDnyFMwtybQZERQ+3I1n0vBbaq+6+AP
 cjrbWVAs9gFGj/ijsvAqTFBPFI21sH24d4KcvK6lVEomMSLT6AFPWNonRX2YCeu9zqgL
 F2LllKFdz7y/8u0cXglETCvUyN7DOJBoVgMNITxsD42PMeQj7E7SD4f06B2TQynUc8qg
 xjGlvdP/MjfqLxFmiOKa9eH2QHeQVfA0qFmVfRj1MdT99YP9OPIARI9YfFDlN+IdcE+p
 i1fQ==
X-Gm-Message-State: AGi0PuYYekbftBow4Li9Lu10VRl7pZDBSQsazNtOsexIpm7I2vp73C3r
 NeI9GhX8lc5SkNKEJYTTl6wBebfs2t3rePKUjOYDsIaEe5wuZtFBuHDHyqi4Y1Z7pNOjIwra/mZ
 WOjjo8U5Zx/CV1+cP4wQkHHB40mHkNP5nai0DDGa35w==
X-Received: by 2002:a1c:1d4b:: with SMTP id d72mr4150356wmd.19.1588343840465; 
 Fri, 01 May 2020 07:37:20 -0700 (PDT)
X-Google-Smtp-Source: APiQypKHqBQQRlsc1K8bjThQcoW9mKD/VyXIIHA6zpDxxO2WCF7VUxpGnsPXDB+8huVAz76rKrLJPQ==
X-Received: by 2002:a1c:1d4b:: with SMTP id d72mr4150333wmd.19.1588343840150; 
 Fri, 01 May 2020 07:37:20 -0700 (PDT)
Received: from steredhat (host108-207-dynamic.49-79-r.retail.telecomitalia.it.
 [79.49.207.108])
 by smtp.gmail.com with ESMTPSA id r20sm4024126wmh.26.2020.05.01.07.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 07:37:19 -0700 (PDT)
Date: Fri, 1 May 2020 16:37:16 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] vhost: vsock: don't send pkt when vq is not started
Message-ID: <20200501143716.ln7hjh3vn77ng43i@steredhat>
References: <20200430021314.6425-1-justin.he@arm.com>
 <20200430082608.wbtqgglmtnd7e5ci@steredhat>
 <AM6PR08MB4069D4AB611B8C8180DC4B9CF7AA0@AM6PR08MB4069.eurprd08.prod.outlook.com>
 <20200430162521.k4b4t3vttfabgqal@steredhat>
 <20200430153929-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200430153929-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Justin He <Justin.He@arm.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Kaly Xin <Kaly.Xin@arm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
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

T24gVGh1LCBBcHIgMzAsIDIwMjAgYXQgMDM6NDM6MDBQTSAtMDQwMCwgTWljaGFlbCBTLiBUc2ly
a2luIHdyb3RlOgo+IE9uIFRodSwgQXByIDMwLCAyMDIwIGF0IDA2OjI1OjIxUE0gKzAyMDAsIFN0
ZWZhbm8gR2FyemFyZWxsYSB3cm90ZToKPiA+IE9uIFRodSwgQXByIDMwLCAyMDIwIGF0IDEwOjA2
OjI2QU0gKzAwMDAsIEp1c3RpbiBIZSB3cm90ZToKPiA+ID4gSGkgU3RlZmFubwo+ID4gPiAKPiA+
ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPiA+IEZyb206IFN0ZWZhbm8gR2Fy
emFyZWxsYSA8c2dhcnphcmVAcmVkaGF0LmNvbT4KPiA+ID4gPiBTZW50OiBUaHVyc2RheSwgQXBy
aWwgMzAsIDIwMjAgNDoyNiBQTQo+ID4gPiA+IFRvOiBKdXN0aW4gSGUgPEp1c3Rpbi5IZUBhcm0u
Y29tPgo+ID4gPiA+IENjOiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+OyBN
aWNoYWVsIFMuIFRzaXJraW4KPiA+ID4gPiA8bXN0QHJlZGhhdC5jb20+OyBKYXNvbiBXYW5nIDxq
YXNvd2FuZ0ByZWRoYXQuY29tPjsKPiA+ID4gPiBrdm1Admdlci5rZXJuZWwub3JnOyB2aXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZzsKPiA+ID4gPiBuZXRkZXZAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBLYWx5IFhpbgo+ID4gPiA+
IDxLYWx5LlhpbkBhcm0uY29tPgo+ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHZob3N0OiB2
c29jazogZG9uJ3Qgc2VuZCBwa3Qgd2hlbiB2cSBpcyBub3Qgc3RhcnRlZAo+ID4gPiA+Cj4gPiA+
ID4gSGkgSmlhLAo+ID4gPiA+IHRoYW5rcyBmb3IgdGhlIHBhdGNoLCBzb21lIGNvbW1lbnRzIGJl
bG93Ogo+ID4gPiA+Cj4gPiA+ID4gT24gVGh1LCBBcHIgMzAsIDIwMjAgYXQgMTA6MTM6MTRBTSAr
MDgwMCwgSmlhIEhlIHdyb3RlOgo+ID4gPiA+ID4gTmluZyBCbyByZXBvcnRlZCBhbiBhYm5vcm1h
bCAyLXNlY29uZCBnYXAgd2hlbiBib290aW5nIEthdGEgY29udGFpbmVyCj4gPiA+ID4gWzFdLgo+
ID4gPiA+ID4gVGhlIHVuY29uZGl0aW9uYWwgdGltZW91dCBpcyBjYXVzZWQgYnkKPiA+ID4gPiBW
U09DS19ERUZBVUxUX0NPTk5FQ1RfVElNRU9VVCBvZgo+ID4gPiA+ID4gY29ubmVjdCBhdCBjbGll
bnQgc2lkZS4gVGhlIHZob3N0IHZzb2NrIGNsaWVudCB0cmllcyB0byBjb25uZWN0IGFuCj4gPiA+
ID4gPiBpbml0bGl6aW5nIHZpcnRpbyB2c29jayBzZXJ2ZXIuCj4gPiA+ID4gPgo+ID4gPiA+ID4g
VGhlIGFibm9ybWFsIGZsb3cgbG9va3MgbGlrZToKPiA+ID4gPiA+IGhvc3QtdXNlcnNwYWNlICAg
ICAgICAgICB2aG9zdCB2c29jayAgICAgICAgICAgICAgICAgICAgICAgZ3Vlc3QgdnNvY2sKPiA+
ID4gPiA+ID09PT09PT09PT09PT09ICAgICAgICAgICA9PT09PT09PT09PSAgICAgICAgICAgICAg
ICAgICAgICAgPT09PT09PT09PT09Cj4gPiA+ID4gPiBjb25uZWN0KCkgICAgIC0tLS0tLS0tPiAg
dmhvc3RfdHJhbnNwb3J0X3NlbmRfcGt0X3dvcmsoKSAgIGluaXRpYWxpemluZwo+ID4gPiA+ID4g
ICAgfCAgICAgICAgICAgICAgICAgICAgIHZxLT5wcml2YXRlX2RhdGE9PU5VTEwKPiA+ID4gPiA+
ICAgIHwgICAgICAgICAgICAgICAgICAgICB3aWxsIG5vdCBiZSBxdWV1ZWQKPiA+ID4gPiA+ICAg
IFYKPiA+ID4gPiA+IHNjaGVkdWxlX3RpbWVvdXQoMnMpCj4gPiA+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgdmhvc3RfdnNvY2tfc3RhcnQoKSAgPC0tLS0tLS0tLSAgIGRldmljZSByZWFk
eQo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIHNldCB2cS0+cHJpdmF0ZV9kYXRh
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gd2FpdCBmb3IgMnMgYW5kIGZhaWxlZAo+ID4gPiA+ID4KPiA+
ID4gPiA+IGNvbm5lY3QoKSBhZ2FpbiAgICAgICAgICB2cS0+cHJpdmF0ZV9kYXRhIT1OVUxMICAg
ICAgICAgIHJlY3YgY29ubmVjdGluZyBwa3QKPiA+ID4gPiA+Cj4gPiA+ID4gPiAxLiBob3N0IHVz
ZXJzcGFjZSBzZW5kcyBhIGNvbm5lY3QgcGt0LCBhdCB0aGF0IHRpbWUsIGd1ZXN0IHZzb2NrIGlz
IHVuZGVyCj4gPiA+ID4gPiBpbml0aWFsaXppbmcsIGhlbmNlIHRoZSB2aG9zdF92c29ja19zdGFy
dCBoYXMgbm90IGJlZW4gY2FsbGVkLiBTbwo+ID4gPiA+ID4gdnEtPnByaXZhdGVfZGF0YT09TlVM
TCwgYW5kIHRoZSBwa3QgaXMgbm90IGJlZW4gcXVldWVkIHRvIHNlbmQgdG8gZ3Vlc3QuCj4gPiA+
ID4gPiAyLiB0aGVuIGl0IHNsZWVwcyBmb3IgMnMKPiA+ID4gPiA+IDMuIGFmdGVyIGd1ZXN0IHZz
b2NrIGZpbmlzaGVzIGluaXRpYWxpemluZywgdnEtPnByaXZhdGVfZGF0YSBpcyBzZXQuCj4gPiA+
ID4gPiA0LiBXaGVuIGhvc3QgdXNlcnNwYWNlIHdha2VzIHVwIGFmdGVyIDJzLCBzZW5kIGNvbm5l
Y3RpbmcgcGt0IGFnYWluLAo+ID4gPiA+ID4gZXZlcnl0aGluZyBpcyBmaW5lLgo+ID4gPiA+ID4K
PiA+ID4gPiA+IFRoaXMgZml4ZXMgaXQgYnkgY2hlY2tpbmcgdnEtPnByaXZhdGVfZGF0YSBpbiB2
aG9zdF90cmFuc3BvcnRfc2VuZF9wa3QsCj4gPiA+ID4gPiBhbmQgcmV0dXJuIGF0IG9uY2UgaWYg
IXZxLT5wcml2YXRlX2RhdGEuIFRoaXMgbWFrZXMgdXNlciBjb25uZWN0KCkKPiA+ID4gPiA+IGJl
IHJldHVybmVkIHdpdGggRUNPTk5SRUZVU0VELgo+ID4gPiA+ID4KPiA+ID4gPiA+IEFmdGVyIHRo
aXMgcGF0Y2gsIGthdGEtcnVudGltZSAod2l0aCB2c29jayBlbmFibGVkKSBib290dGltZSByZWR1
Y2VzIGZyb20KPiA+ID4gPiA+IDNzIHRvIDFzIG9uIFRodW5kZXJYMiBhcm02NCBzZXJ2ZXIuCj4g
PiA+ID4gPgo+ID4gPiA+ID4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9rYXRhLWNvbnRhaW5lcnMv
cnVudGltZS9pc3N1ZXMvMTkxNwo+ID4gPiA+ID4KPiA+ID4gPiA+IFJlcG9ydGVkLWJ5OiBOaW5n
IEJvIDxuLmJAbGl2ZS5jb20+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKaWEgSGUgPGp1c3Rp
bi5oZUBhcm0uY29tPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgZHJpdmVycy92aG9zdC92c29j
ay5jIHwgOCArKysrKysrKwo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KykKPiA+ID4gPiA+Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC92c29jay5j
IGIvZHJpdmVycy92aG9zdC92c29jay5jCj4gPiA+ID4gPiBpbmRleCBlMzZhYWY5YmE3YmQuLjY3
NDc0MzM0ZGQ4OCAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvdmhvc3QvdnNvY2suYwo+
ID4gPiA+ID4gKysrIGIvZHJpdmVycy92aG9zdC92c29jay5jCj4gPiA+ID4gPiBAQCAtMjQxLDYg
KzI0MSw3IEBAIHZob3N0X3RyYW5zcG9ydF9zZW5kX3BrdChzdHJ1Y3QgdmlydGlvX3Zzb2NrX3Br
dAo+ID4gPiA+ICpwa3QpCj4gPiA+ID4gPiAgewo+ID4gPiA+ID4gIHN0cnVjdCB2aG9zdF92c29j
ayAqdnNvY2s7Cj4gPiA+ID4gPiAgaW50IGxlbiA9IHBrdC0+bGVuOwo+ID4gPiA+ID4gK3N0cnVj
dCB2aG9zdF92aXJ0cXVldWUgKnZxOwo+ID4gPiA+ID4KPiA+ID4gPiA+ICByY3VfcmVhZF9sb2Nr
KCk7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gQEAgLTI1Miw2ICsyNTMsMTMgQEAgdmhvc3RfdHJhbnNw
b3J0X3NlbmRfcGt0KHN0cnVjdCB2aXJ0aW9fdnNvY2tfcGt0Cj4gPiA+ID4gKnBrdCkKPiA+ID4g
PiA+ICByZXR1cm4gLUVOT0RFVjsKPiA+ID4gPiA+ICB9Cj4gPiA+ID4gPgo+ID4gPiA+ID4gK3Zx
ID0gJnZzb2NrLT52cXNbVlNPQ0tfVlFfUlhdOwo+ID4gPiA+ID4gK2lmICghdnEtPnByaXZhdGVf
ZGF0YSkgewo+ID4gPiA+Cj4gPiA+ID4gSSB0aGluayBpcyBiZXR0ZXIgdG8gdXNlIHZob3N0X3Zx
X2dldF9iYWNrZW5kKCk6Cj4gPiA+ID4KPiA+ID4gPiBpZiAoIXZob3N0X3ZxX2dldF9iYWNrZW5k
KCZ2c29jay0+dnFzW1ZTT0NLX1ZRX1JYXSkpIHsKPiA+ID4gPiAuLi4KPiA+ID4gPgo+ID4gPiA+
IFRoaXMgZnVuY3Rpb24gc2hvdWxkIGJlIGNhbGxlZCB3aXRoICd2cS0+bXV0ZXgnIGFjcXVpcmVk
IGFzIGV4cGxhaW5lZCBpbgo+ID4gPiA+IHRoZSBjb21tZW50LCBidXQgaGVyZSB3ZSBjYW4gYXZv
aWQgdGhhdCwgYmVjYXVzZSB3ZSBhcmUgbm90IHVzaW5nIHRoZSB2cSwKPiA+ID4gPiBzbyBpdCBp
cyBzYWZlLCBiZWNhdXNlIGluIHZob3N0X3RyYW5zcG9ydF9kb19zZW5kX3BrdCgpIHdlIGNoZWNr
IGl0IGFnYWluLgo+ID4gPiA+Cj4gPiA+ID4gUGxlYXNlIGFkZCBhIGNvbW1lbnQgZXhwbGFpbmlu
ZyB0aGF0Lgo+ID4gPiA+Cj4gPiA+IAo+ID4gPiBUaGFua3MsIHZob3N0X3ZxX2dldF9iYWNrZW5k
IGlzIGJldHRlci4gSSBjaG9zZSBhIDUuMyBrZXJuZWwgdG8gZGV2ZWxvcAo+ID4gPiBhbmQgbWlz
c2VkIHRoaXMgaGVscGVyLgo+ID4gCj4gPiA6LSkKPiA+IAo+ID4gPiA+Cj4gPiA+ID4gQXMgYW4g
YWx0ZXJuYXRpdmUgdG8gdGhpcyBwYXRjaCwgc2hvdWxkIHdlIGtpY2sgdGhlIHNlbmQgd29ya2Vy
IHdoZW4gdGhlCj4gPiA+ID4gZGV2aWNlIGlzIHJlYWR5Pwo+ID4gPiA+Cj4gPiA+ID4gSUlVQyB3
ZSByZWFjaCB0aGUgdGltZW91dCBiZWNhdXNlIHRoZSBzZW5kIHdvcmtlciAodGhhdCBydW5zCj4g
PiA+ID4gdmhvc3RfdHJhbnNwb3J0X2RvX3NlbmRfcGt0KCkpIGV4aXRzIGltbWVkaWF0ZWx5IHNp
bmNlICd2cS0+cHJpdmF0ZV9kYXRhJwo+ID4gPiA+IGlzIE5VTEwsIGFuZCBubyBvbmUgd2lsbCBy
ZXF1ZXVlIGl0Lgo+ID4gPiA+Cj4gPiA+ID4gTGV0J3MgZG8gaXQgd2hlbiB3ZSBrbm93IHRoZSBk
ZXZpY2UgaXMgcmVhZHk6Cj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9z
dC92c29jay5jIGIvZHJpdmVycy92aG9zdC92c29jay5jCj4gPiA+ID4gaW5kZXggZTM2YWFmOWJh
N2JkLi4yOTViNTg2Nzk0NGYgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy92aG9zdC92c29j
ay5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy92aG9zdC92c29jay5jCj4gPiA+ID4gQEAgLTU0Myw2
ICs1NDMsMTEgQEAgc3RhdGljIGludCB2aG9zdF92c29ja19zdGFydChzdHJ1Y3Qgdmhvc3RfdnNv
Y2sKPiA+ID4gPiAqdnNvY2spCj4gPiA+ID4gICAgICAgICAgICAgICAgIG11dGV4X3VubG9jaygm
dnEtPm11dGV4KTsKPiA+ID4gPiAgICAgICAgIH0KPiA+ID4gPgo+ID4gPiA+ICsgICAgICAgLyog
U29tZSBwYWNrZXRzIG1heSBoYXZlIGJlZW4gcXVldWVkIGJlZm9yZSB0aGUgZGV2aWNlIHdhcyBz
dGFydGVkLAo+ID4gPiA+ICsgICAgICAgICogbGV0J3Mga2ljayB0aGUgc2VuZCB3b3JrZXIgdG8g
c2VuZCB0aGVtLgo+ID4gPiA+ICsgICAgICAgICovCj4gPiA+ID4gKyAgICAgICB2aG9zdF93b3Jr
X3F1ZXVlKCZ2c29jay0+ZGV2LCAmdnNvY2stPnNlbmRfcGt0X3dvcmspOwo+ID4gPiA+ICsKPiA+
ID4gWWVzLCBpdCB3b3Jrcy4KPiA+ID4gQnV0IGRvIHlvdSB0aGluayBhIHRocmVzaG9sZCBzaG91
bGQgYmUgc2V0IGhlcmUgdG8gcHJldmVudCB0aGUgcXVldWUKPiA+ID4gZnJvbSBiZWluZyB0b28g
bG9uZz8gRS5nLiB0aGUgY2xpZW50IHVzZXIgc2VuZHMgdG9vIG1hbnkgY29ubmVjdCBwa3RzCj4g
PiA+IGluIGEgc2hvcnQgdGltZSBiZWZvcmUgdGhlIHNlcnZlciBpcyBjb21wbGV0ZWx5IHJlYWR5
Lgo+ID4gCj4gPiBXaGVuIHRoZSB1c2VyIGNhbGwgdGhlIGNvbm5lY3QoKSB0aGUgc29ja2V0IHN0
YXR1cyBpcyBtb3ZlZCB0bwo+ID4gU1NfQ09OTkVDVElORyAoc2VlIG5ldC92bXdfdnNvY2svYWZf
dnNvY2suYyksIHNvIGFub3RoZXIgY29ubmVjdCgpIG9uCj4gPiB0aGUgc2FtZSBzb2NrZXQgd2ls
bCByZWNlaXZlIEVBTFJFQURZIGVycm9yLgo+ID4gCj4gPiBJZiB0aGUgdXNlciB1c2VzIG11bHRp
cGxlIHNvY2tldHMsIHRoZSBzb2NrZXQgbGF5ZXIgYWxyZWFkeSBjaGVjayBmb3IKPiA+IGFueSBs
aW1pdHMsIHNvIEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIHB1dCBhIHRocmVzaG9sZCBoZXJlLgo+
ID4gCj4gPiA+IAo+ID4gPiA+ICAgICAgICAgbXV0ZXhfdW5sb2NrKCZ2c29jay0+ZGV2Lm11dGV4
KTsKPiA+ID4gPiAgICAgICAgIHJldHVybiAwOwo+ID4gPiA+Cj4gPiA+ID4gSSBkaWRuJ3QgdGVz
dCBpdCwgY2FuIHlvdSB0cnkgaWYgaXQgZml4ZXMgdGhlIGlzc3VlPwo+ID4gPiA+Cj4gPiA+ID4g
SSdtIG5vdCBzdXJlIHdoaWNoIGlzIGJldHRlci4uLgo+ID4gPiBJIGRvbid0IGtub3csIGVpdGhl
ci4gV2FpdCBmb3IgbW9yZSBjb21tZW50cyDwn5iKCj4gPiAKPiA+IEkgcHJlZmVyIHRoZSBzZWNv
bmQgb3B0aW9uLCBiZWNhdXNlIHRoZSBkZXZpY2UgaXMgaW4gYSB0cmFuc2l0aW9uYWwKPiA+IHN0
YXRlIGFuZCBhIGNvbm5lY3QgY2FuIGJsb2NrIChmb3IgYXQgbW9zdCB0d28gc2Vjb25kcykgdW50
aWwgdGhlIGRldmljZSBpcwo+ID4gc3RhcnRlZC4KPiA+IAo+ID4gRm9yIHRoZSBmaXJzdCBvcHRp
b24sIEknbSBhbHNvIG5vdCBzdXJlIGlmIEVDT05OUkVGVVNFRCBpcyB0aGUgcmlnaHQgZXJyb3IK
PiA+IHRvIHJldHVybiwgbWF5YmUgaXMgYmV0dGVyIEVORVRVTlJFQUNILgo+ID4gCj4gPiBDaGVl
cnMsCj4gPiBTdGVmYW5vCj4gCj4gSUlSQzoKPiAKPiBFQ09OTlJFRlVTRUQgaXMgd2hhdCBvbmUg
Z2V0cyB3aGVuIGNvbm5lY3RpbmcgdG8gcmVtb3RlIGEgcG9ydCB3aGljaCBkb2VzIG5vdAo+IHll
dCBoYXZlIGEgbGlzdGVuaW5nIHNvY2tldCwgc28gcmVtb3RlIHNlbmRzIGJhY2sgUlNULgo+IEVO
RVRVTlJFQUNIIGlzIHdoZW4gbG9jYWwgbmV0d29yaydzIGRvd24sIHNvIHlvdSBjYW4ndCBldmVu
IHNlbmQgYQo+IGNvbm5lY3Rpb24gcmVxdWVzdC4KPiBFSE9TVFVOUkVBQ0ggaXMgcmVtb3RlIG5l
dHdvcmsgaXMgZG93bi4KClRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24hCgpJIHdhcyBsb29r
aW5nIGF0IGNvbm5lY3QoMikgbWFuIHBhZ2UgYW5kIHRoZXJlIGlzbid0IEVIT1NUVU5SRUFDSCBp
biB0aGUKRVJST1JTIHNlY3Rpb24gOi0oCgpCdXQgY29ubmVjdCgzcCkgY29udGFpbnMgdGhlIGZv
bGxvd2luZyB0aGF0IG1hdGNoIHdoYXQgeW91IHNhaWQ6CiAgICAgICBFQ09OTlJFU0VUCiAgICAg
ICAgICAgICAgUmVtb3RlIGhvc3QgcmVzZXQgdGhlIGNvbm5lY3Rpb24gcmVxdWVzdC4KICAgICAg
IEVORVRVTlJFQUNICiAgICAgICAgICAgICAgTm8gcm91dGUgdG8gdGhlIG5ldHdvcmsgaXMgcHJl
c2VudC4KICAgICAgIEVIT1NUVU5SRUFDSAogICAgICAgICAgICAgIFRoZSAgZGVzdGluYXRpb24g
aG9zdCBjYW5ub3QgYmUgcmVhY2hlZCAocHJvYmFibHkgYmVjYXVzZQogICAgICAgICAgICAgIHRo
ZSBob3N0IGlzIGRvd24gb3IgYSByZW1vdGUgcm91dGVyIGNhbm5vdCByZWFjaCBpdCkuCgpTbyBp
biB0aGlzIGNhc2UsIEkgdGhpbmsgRU5FVFVOUkVBQ0ggc2hvdWxkIGJlIHRoZSBiZXN0IG9uZSwg
c2luY2UgdGhlCmRldmljZSBpcyBkb3duIGFuZCB3ZSBjYW4ndCBzZW5kIHRoZSBjb25uZWN0aW9u
IHJlcXVlc3QsIGJ1dCBhbHNvCkVIT1NUVU5SRUFDSCBzaG91bGQgZml0Li4uCgpJbiBhZl92c29j
ay5jIHdlIGFscmVhZHkgcmV0dXJuIEVORVRVTlJFQUNIIHdoZW4gdGhlIHN0cmVhbSBpcyBub3Qg
YWxsb3dlZApvciB3ZSBkb24ndCBoYXZlIGEgdHJhbnNwb3J0IHRvIHVzZS4KClRoYW5rcywKU3Rl
ZmFubwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmly
dHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5k
YXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3ZpcnR1YWxpemF0aW9u
