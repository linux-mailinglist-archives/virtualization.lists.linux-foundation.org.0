Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C16819C708
	for <lists.virtualization@lfdr.de>; Thu,  2 Apr 2020 18:27:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 46363204A9;
	Thu,  2 Apr 2020 16:27:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q+mxZbU29r3Q; Thu,  2 Apr 2020 16:27:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4499F2670B;
	Thu,  2 Apr 2020 16:27:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E68CC07FF;
	Thu,  2 Apr 2020 16:27:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D177BC07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 16:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BFFC3883CF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 16:27:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KHkMMGZoAYJc
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 16:27:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 088A088325
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 16:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585844836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YiGejvc/Z1PscIO5Y2Td9wzrTW6YFSsKAEAcda9xkVg=;
 b=Rljbpn9Z5gnazQhxUO+OxqkwTx+aJFADto8WgeRjj9oWeGh4jdJGNuUP/uqDYt4p0cMC/9
 WBWJx7fJH7J0m6k3AnN2jp65jv0d2HCPa0Q1X/2MjYou39A0tUozDfhwqtnWJ3dKxUEemW
 8c4lFu6S7kmMfka5pRyoeJUqVUpseMI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-Yu0jYR2yPwqMTKTZR1n_lQ-1; Thu, 02 Apr 2020 12:27:15 -0400
X-MC-Unique: Yu0jYR2yPwqMTKTZR1n_lQ-1
Received: by mail-qt1-f197.google.com with SMTP id v16so3700035qtj.1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Apr 2020 09:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=YiGejvc/Z1PscIO5Y2Td9wzrTW6YFSsKAEAcda9xkVg=;
 b=JLOgxbEDLAk3a1ksxntFsmCplXo3bSz6SmsULRTFIKowLJ40x6YqDzfrn30XS7Sl1B
 YR0Q3pBpXhUnPvtOLCwV2h15pDaLvLMz50e5Tujm/FOypVrb7IrEdLpDpV/ON4ZkGkNO
 WH+VtwcMsl7oOXNE8mbEiG9ZhX5jFeDklN3jABSkttmKv8FJj0HF3LXjP4dRJ1WnrKe7
 RldfdrTZmBV9ft+1Ad6g84SSy/snWV2TbizmnYANneLEfI+BvItdBn7/VcU7pSqW006X
 xbRdV5q1IDnRA6IdXc89epp20pZ+MeeqBqHljHTNDu1BXAlyjNUGz7LedWNPIL4P/Q3K
 5ftg==
X-Gm-Message-State: AGi0PuakAyp/+Y2hSIxoVb+2w2NePLCwRjoNMsF2OXnEM/OmmaSCgjlE
 Ta9W2RavBIsKSO+1sx2dNBhHped+ja6Gl9EoMRv7mi4BLGPrkQytKk59EMdzbu3YHX52Q3Px/pV
 IdsCrxQh1yIYgIoeumhnIgf8RWh/v9Q0Bpn7QgXJoQw==
X-Received: by 2002:ac8:4641:: with SMTP id f1mr3595345qto.216.1585844834572; 
 Thu, 02 Apr 2020 09:27:14 -0700 (PDT)
X-Google-Smtp-Source: APiQypI9uiNgZebAWGTM/6pTKMcpl2+Pbh6hcnrsxur+SijZm8gBzgmehd7nG3POHrAdyCwNw6XVFw==
X-Received: by 2002:ac8:4641:: with SMTP id f1mr3595317qto.216.1585844834186; 
 Thu, 02 Apr 2020 09:27:14 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id v17sm3764796qkf.83.2020.04.02.09.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 09:27:13 -0700 (PDT)
Date: Thu, 2 Apr 2020 12:27:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v2] vhost: drop vring dependency on iotlb
Message-ID: <20200402122544-mutt-send-email-mst@kernel.org>
References: <20200402144519.34194-1-mst@redhat.com>
 <44f9b9d3-3da2-fafe-aa45-edd574dc6484@redhat.com>
MIME-Version: 1.0
In-Reply-To: <44f9b9d3-3da2-fafe-aa45-edd574dc6484@redhat.com>
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

T24gVGh1LCBBcHIgMDIsIDIwMjAgYXQgMTE6MDE6MTNQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzQvMiDkuIvljYgxMDo0NiwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gdnJpbmdoIGNhbiBub3cgYmUgYnVpbHQgd2l0aG91dCBJT1RMQi4KPiA+IFNlbGVjdCBJ
T1RMQiBkaXJlY3RseSB3aGVyZSBpdCdzIHVzZWQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1p
Y2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Cj4gPiAtLS0KPiA+IAo+ID4gQXBwbGll
cyBvbiB0b3Agb2YgbXkgdmhvc3QgdHJlZS4KPiA+IENoYW5nZXMgZnJvbSB2MToKPiA+IAlWRFBB
X1NJTSBuZWVkcyBWSE9TVF9JT1RMQgo+IAo+IAo+IEl0IGxvb2tzIHRvIG1lIHRoZSBwYXRjaCBp
cyBpZGVudGljYWwgdG8gdjEuCj4gCj4gVGhhbmtzCgoKeW91IGFyZSByaWdodC4gSSBzcXVhc2hl
ZCB0aGUgZGVzY3JpcHRpb24gaW50bwogICAgdmlydGlvL3Rlc3Q6IGZpeCB1cCBhZnRlciBJT1RM
QiBjaGFuZ2VzCnRha2UgYSBsb29rIGF0IGl0IGluIHRoZSB2aG9zdCB0cmVlLgoKPiAKPiA+IAo+
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
bmZpZyBiL2RyaXZlcnMvdmhvc3QvS2NvbmZpZwo+ID4gaW5kZXggZjA0MDRjZTI1NWQxLi5jYjZi
MTczMjNlYjIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3Zob3N0L0tjb25maWcKPiA+ICsrKyBi
L2RyaXZlcnMvdmhvc3QvS2NvbmZpZwo+ID4gQEAgLTgsNyArOCw2IEBAIGNvbmZpZyBWSE9TVF9J
T1RMQgo+ID4gICBjb25maWcgVkhPU1RfUklORwo+ID4gICAJdHJpc3RhdGUKPiA+IC0Jc2VsZWN0
IFZIT1NUX0lPVExCCj4gPiAgIAloZWxwCj4gPiAgIAkgIFRoaXMgb3B0aW9uIGlzIHNlbGVjdGVk
IGJ5IGFueSBkcml2ZXIgd2hpY2ggbmVlZHMgdG8gYWNjZXNzCj4gPiAgIAkgIHRoZSBob3N0IHNp
ZGUgb2YgYSB2aXJ0aW8gcmluZy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBs
aXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
