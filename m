Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE2719C461
	for <lists.virtualization@lfdr.de>; Thu,  2 Apr 2020 16:36:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9632988A76;
	Thu,  2 Apr 2020 14:36:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r5a5bpa75hZ5; Thu,  2 Apr 2020 14:36:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 02B6C88A98;
	Thu,  2 Apr 2020 14:36:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7B91C1D89;
	Thu,  2 Apr 2020 14:36:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1C8CCC07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1977487FBE
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F8xs1lhAkmQU
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:36:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7A81687FB5
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585838210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WlR2TRXNoUHH0cejtWwgFkeiMST3WWqkeQGN0pr6VCA=;
 b=gXzhi9blke8Ut2CtjcEE6gO0ne7PXiA24skhNMy8llV4Sw9g6HSx7iSTZIZZXWvd1KGjd/
 7hQ6aWPny5UFuLDJNcn/DSkvCjfXmSnq2s7oiG2YPfYiHsRxo9gpFAHcalv+o7EYG3z9wz
 L+PmxMNB25odJov8tdUDa7IltOt2VIw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-15EuvQ2cMguuuKWfQd4zKg-1; Thu, 02 Apr 2020 10:36:48 -0400
X-MC-Unique: 15EuvQ2cMguuuKWfQd4zKg-1
Received: by mail-qt1-f198.google.com with SMTP id t6so3312442qtj.12
 for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Apr 2020 07:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=WlR2TRXNoUHH0cejtWwgFkeiMST3WWqkeQGN0pr6VCA=;
 b=shQkGR0S0eMhTmi6p976c4mE2MNrfv3EDXei2Oo6bcviObnJ1vGlwZVeff6Z2UwHrv
 DTrR5wZLWKiQkRpAtTFTInAHJ3PXgmyrzLZz/1MjljU4d9iGTOaP6vPGZ79cDmtIoO+X
 IGgi9OYFSSKlWSFlksvud2j2LnpEIbkcRUGFzwcvAr7NRZR6GIBVGPfE0cONFYnRsF2m
 E9IIAjLT+XHhY3VCc2ivScmaj++yJ5EqKjS7XCC4WBYNgDfeU0jWbxvR/Lc5nIExnDLm
 bbj3NhEyBuMNabJG4aWWEl9nX79hTeZEwRHjL2UpvhtYITolWf83KlTupivGb78+HrpN
 p1Cg==
X-Gm-Message-State: AGi0PuZFGDjMm/Qf+Zl8VZZ55uJI8vFhBeaD6LfnHMTU9Lq/xXB/Ewsp
 HzQjopSESMav+H82MSwYTdnNI4nIH45ueaNVFITGn0FLe3y9J6nKUVXdd2Ds1cKCxBBFxKhpMx5
 NCAVkwWeObKcy0znQBvsUa4HWbzXGnR03MC0B7RyN7Q==
X-Received: by 2002:ac8:1bf5:: with SMTP id m50mr3204226qtk.200.1585838208363; 
 Thu, 02 Apr 2020 07:36:48 -0700 (PDT)
X-Google-Smtp-Source: APiQypJIJxmszAzRx8icml77RBvawgNMOKh/hgQNez6YoUnUaICm+K3+fAJ0a9bgYwRVNdObKb/nbw==
X-Received: by 2002:ac8:1bf5:: with SMTP id m50mr3204184qtk.200.1585838207990; 
 Thu, 02 Apr 2020 07:36:47 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id u40sm3854770qtc.62.2020.04.02.07.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 07:36:47 -0700 (PDT)
Date: Thu, 2 Apr 2020 10:36:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vhost: drop vring dependency on iotlb
Message-ID: <20200402103551-mutt-send-email-mst@kernel.org>
References: <20200402141207.32628-1-mst@redhat.com>
 <afe230b9-708f-02a1-c3af-51e9d4fdd212@redhat.com>
MIME-Version: 1.0
In-Reply-To: <afe230b9-708f-02a1-c3af-51e9d4fdd212@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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

T24gVGh1LCBBcHIgMDIsIDIwMjAgYXQgMTA6Mjg6MjhQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzQvMiDkuIvljYgxMDoxMiwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gdnJpbmdoIGNhbiBub3cgYmUgYnVpbHQgd2l0aG91dCBJT1RMQi4KPiA+IFNlbGVjdCBJ
T1RMQiBkaXJlY3RseSB3aGVyZSBpdCdzIHVzZWQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1p
Y2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Cj4gPiAtLS0KPiA+IAo+ID4gVGhpcyBp
cyBvbiB0b3Agb2YgbXkgcHJldmlvdXMgcGF0Y2ggKGluIHZob3N0IHRyZWUgbm93KS4KPiA+IAo+
ID4gICBkcml2ZXJzL3ZkcGEvS2NvbmZpZyAgfCAxICsKPiA+ICAgZHJpdmVycy92aG9zdC9LY29u
ZmlnIHwgMSAtCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmRwYS9LY29uZmlnIGIvZHJpdmVy
cy92ZHBhL0tjb25maWcKPiA+IGluZGV4IDdkYjE0NjAxMDRiNy4uMDhiNjE1ZjJkYTM5IDEwMDY0
NAo+ID4gLS0tIGEvZHJpdmVycy92ZHBhL0tjb25maWcKPiA+ICsrKyBiL2RyaXZlcnMvdmRwYS9L
Y29uZmlnCj4gPiBAQCAtMTcsNiArMTcsNyBAQCBjb25maWcgVkRQQV9TSU0KPiA+ICAgCWRlcGVu
ZHMgb24gUlVOVElNRV9URVNUSU5HX01FTlUKPiA+ICAgCXNlbGVjdCBWRFBBCj4gPiAgIAlzZWxl
Y3QgVkhPU1RfUklORwo+ID4gKwlzZWxlY3QgVkhPU1RfSU9UTEIKPiA+ICAgCWRlZmF1bHQgbgo+
ID4gICAJaGVscAo+ID4gICAJICB2RFBBIG5ldHdvcmtpbmcgZGV2aWNlIHNpbXVsYXRvciB3aGlj
aCBsb29wIFRYIHRyYWZmaWMgYmFjawo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3QvS2Nv
bmZpZyBiL2RyaXZlcnMvdmhvc3QvS2NvbmZpZwo+ID4gaW5kZXggMjFmZWVhMGQ2OWM5Li5iZGQy
NzBmZWRlMjYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3Zob3N0L0tjb25maWcKPiA+ICsrKyBi
L2RyaXZlcnMvdmhvc3QvS2NvbmZpZwo+ID4gQEAgLTYsNyArNiw2IEBAIGNvbmZpZyBWSE9TVF9J
T1RMQgo+ID4gICBjb25maWcgVkhPU1RfUklORwo+ID4gICAJdHJpc3RhdGUKPiA+IC0Jc2VsZWN0
IFZIT1NUX0lPVExCCj4gPiAgIAloZWxwCj4gPiAgIAkgIFRoaXMgb3B0aW9uIGlzIHNlbGVjdGVk
IGJ5IGFueSBkcml2ZXIgd2hpY2ggbmVlZHMgdG8gYWNjZXNzCj4gPiAgIAkgIHRoZSBob3N0IHNp
ZGUgb2YgYSB2aXJ0aW8gcmluZy4KPiAKPiAKPiBEbyB3ZSBuZWVkIHRvIG1lbnRpb24gZHJpdmVy
IG5lZWQgdG8gc2VsZWN0IFZIT1NUX0lPVExCIGJ5IGl0c2VsZiBoZXJlPwo+IAo+IFRoYW5rcwo+
IAoKT0sgYnV0IEkgZ3Vlc3MgaXQncyBiZXN0IHRvIGRvIGl0IG5lYXIgd2hlcmUgVkhPU1RfSU9U
TEIgaXMgZGVmaW5lZC4KTGlrZSB0aGlzPwoKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L0tj
b25maWcgYi9kcml2ZXJzL3Zob3N0L0tjb25maWcKaW5kZXggYmRkMjcwZmVkZTI2Li5jZTUxMTI2
ZjUxZTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmhvc3QvS2NvbmZpZworKysgYi9kcml2ZXJzL3Zo
b3N0L0tjb25maWcKQEAgLTMsNiArMyw4IEBAIGNvbmZpZyBWSE9TVF9JT1RMQgogCXRyaXN0YXRl
CiAJaGVscAogCSAgR2VuZXJpYyBJT1RMQiBpbXBsZW1lbnRhdGlvbiBmb3Igdmhvc3QgYW5kIHZy
aW5naC4KKwkgIFRoaXMgb3B0aW9uIGlzIHNlbGVjdGVkIGJ5IGFueSBkcml2ZXIgd2hpY2ggbmVl
ZHMgdG8gc3VwcG9ydAorCSAgYW4gSU9NTVUgaW4gc29mdHdhcmUuCiAKIGNvbmZpZyBWSE9TVF9S
SU5HCiAJdHJpc3RhdGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
