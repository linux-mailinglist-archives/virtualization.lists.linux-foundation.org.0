Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B8C21EC0E
	for <lists.virtualization@lfdr.de>; Tue, 14 Jul 2020 11:03:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B0E72891C2;
	Tue, 14 Jul 2020 09:03:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lngtLdMQBWCE; Tue, 14 Jul 2020 09:03:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2992A891C5;
	Tue, 14 Jul 2020 09:03:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E40B3C0733;
	Tue, 14 Jul 2020 09:03:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C54F7C0733
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 09:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B3209891C5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 09:03:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7tTchzuRKt_U
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 09:03:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id ED8AC891C2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 09:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594717411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DfzrpnDksjrV/E9eLW/uyC+yehYtUw0XCcZEGedYMzg=;
 b=anqTNRxnbNjw7sCY5XrGLqpLDGOHoeQIyDaRmmo52MfWxXmGTZCUN9ZGkRf5lYSXFe9vqk
 sHvh/hF5ziDpLgzzxTNKGd8sb338EWIIPkqHvZyVuN/4+kMPtg3w/T/a2sqrmOTKbl6fuO
 NSQhsPOr46MRTvhsIDyHfxidJiap2fA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-e5GGZdZEPGy8rd9OA0rRcQ-1; Tue, 14 Jul 2020 05:03:29 -0400
X-MC-Unique: e5GGZdZEPGy8rd9OA0rRcQ-1
Received: by mail-wm1-f72.google.com with SMTP id v6so2988726wmg.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 02:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DfzrpnDksjrV/E9eLW/uyC+yehYtUw0XCcZEGedYMzg=;
 b=p4CNP5j5RhYqWdnyJFPtQzx69QnyJoE61zDdtFbRpE4HoL5gmL+n1sLEN/VwhuyxVU
 k6xUZD2Hv7BTFdqOOKknfLPSGnmvDSttFIp+dy2qkKikeHkMbQEgvgFoB09i4vdrwNvB
 2xMfs4o8NvO8z/iu/2r/Nvh5On3swFqn0mgrzYpwcqPTerr4y+6EU/GJMeIXoSLiUcu3
 LpXV5CGV9FGOVJ695xpO8Aix8Gmq7WtTlb1mznkEaQ+jD1iNlnHT/a/zknq25E9EIWqS
 G6asXSlvsJdA1SmDxQrs0fYtT3PaIZd5iJK2UeV52Po8Oiu1y85FQLr/4Z3JT2zCqt54
 9z4Q==
X-Gm-Message-State: AOAM531PMmloEodxIR6HgDufJhJxjPJkaS2rw1RhNpa9GtnX4cSi2SEe
 jAjkzsBldeH5ln84ddMoyu46yBBarymvyxeS6A2URrNYVbxFERMNV++iCoELo9BOWC0gut3KPQu
 tXheAN3ZI4ZPaBmOwUEXY7Ms9UBJZGLB527xe13lSiQ==
X-Received: by 2002:a7b:c92e:: with SMTP id h14mr3197921wml.36.1594717408731; 
 Tue, 14 Jul 2020 02:03:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXFKbRHAyh+9vVQvN7eLfJsIxJJAssbByyfjo+ePDaaH3nSHiQ776m2H8PMkGHjwfKUW7mHg==
X-Received: by 2002:a7b:c92e:: with SMTP id h14mr3197913wml.36.1594717408523; 
 Tue, 14 Jul 2020 02:03:28 -0700 (PDT)
Received: from redhat.com (bzq-79-180-10-140.red.bezeqint.net. [79.180.10.140])
 by smtp.gmail.com with ESMTPSA id y77sm3755145wmd.36.2020.07.14.02.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 02:03:27 -0700 (PDT)
Date: Tue, 14 Jul 2020 05:03:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Subject: Re: [PATCH 2/7] kvm/vfio: detect assigned device via irqbypass manager
Message-ID: <20200714050301-mutt-send-email-mst@kernel.org>
References: <1594565366-3195-1-git-send-email-lingshan.zhu@intel.com>
 <1594565366-3195-2-git-send-email-lingshan.zhu@intel.com>
 <20200712170518-mutt-send-email-mst@kernel.org>
 <bcb03e95-d8b9-6e19-5b0e-0119d3f43d6d@redhat.com>
 <20200713065222-mutt-send-email-mst@kernel.org>
 <aca899f7-ec2e-2b55-df78-44eacb923c00@intel.com>
MIME-Version: 1.0
In-Reply-To: <aca899f7-ec2e-2b55-df78-44eacb923c00@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: wanpengli@tencent.com, kvm@vger.kernel.org, netdev@vger.kernel.org,
 sean.j.christopherson@intel.com, virtualization@lists.linux-foundation.org,
 pbonzini@redhat.com
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

T24gVHVlLCBKdWwgMTQsIDIwMjAgYXQgMDg6NTI6NDNBTSArMDgwMCwgWmh1LCBMaW5nc2hhbiB3
cm90ZToKPiAKPiBPbiA3LzEzLzIwMjAgNjo1MiBQTSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+IAo+ICAgICBPbiBNb24sIEp1bCAxMywgMjAyMCBhdCAwNDoxMzozNVBNICswODAwLCBKYXNv
biBXYW5nIHdyb3RlOgo+IAo+ICAgICAgICAgT24gMjAyMC83LzEzIOS4iuWNiDU6MDYsIE1pY2hh
ZWwgUy4gVHNpcmtpbiB3cm90ZToKPiAKPiAgICAgICAgICAgICBPbiBTdW4sIEp1bCAxMiwgMjAy
MCBhdCAxMDo0OToyMVBNICswODAwLCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4gCj4gICAgICAgICAg
ICAgICAgIFdlIHVzZWQgdG8gZGV0ZWN0IGFzc2lnbmVkIGRldmljZSB2aWEgVkZJTyBtYW5pcHVs
YXRlZCBkZXZpY2UKPiAgICAgICAgICAgICAgICAgY29udGVycy4gVGhpcyBpcyBsZXNzIGZsZXhp
YmxlIGNvbnNpZGVyIFZGSU8gaXMgbm90IHRoZSBvbmx5Cj4gICAgICAgICAgICAgICAgIGludGVy
ZmFjZSBmb3IgYXNzaWduZWQgZGV2aWNlLiB2RFBBIGRldmljZXMgaGFzIGRlZGljYXRlZAo+ICAg
ICAgICAgICAgICAgICBiYWNrZWQgaGFyZHdhcmUgYXMgd2VsbC4gU28gdGhpcyBwYXRjaCB0cmll
cyB0byBkZXRlY3QKPiAgICAgICAgICAgICAgICAgdGhlIGFzc2lnbmVkIGRldmljZSB2aWEgaXJx
YnlwYXNzIG1hbmFnZXIuCj4gCj4gICAgICAgICAgICAgICAgIFdlIHdpbGwgaW5jcmVhc2UvZGVj
cmVhc2UgdGhlIGFzc2lnbmVkIGRldmljZSBjb3VudGVyIGluIGt2bS94ODYuCj4gICAgICAgICAg
ICAgICAgIEJvdGggdkRQQSBhbmQgVkZJTyB3b3VsZCBnbyB0aHJvdWdoIHRoaXMgY29kZSBwYXRo
Lgo+IAo+ICAgICAgICAgICAgICAgICBUaGlzIGNvZGUgcGF0aCBvbmx5IGFmZmVjdCB4ODYgZm9y
IG5vdy4KPiAKPiAgICAgICAgICAgICAgICAgU2lnbmVkLW9mZi1ieTogWmh1IExpbmdzaGFuIDxs
aW5nc2hhbi56aHVAaW50ZWwuY29tPgo+IAo+ICAgICAgICAgICAgIEkgdGhpbmsgaXQncyBiZXN0
IHRvIGxlYXZlIFZGSU8gYWxvbmUuIEFkZCBhcHByb3ByaWF0ZSBBUElzIGZvciBWRFBBLAo+ICAg
ICAgICAgICAgIHdvcnJ5IGFib3V0IGNvbnZlcnRpbmcgZXhpc3RpbmcgdXNlcnMgbGF0ZXIuCj4g
Cj4gCj4gCj4gICAgICAgICBKdXN0IHRvIG1ha2Ugc3VyZSBJIHVuZGVyc3RhbmQsIGRpZCB5b3Ug
bWVhbjoKPiAKPiAgICAgICAgIDEpIGludHJvZHVjZSBhbm90aGVyIGJyaWRnZSBmb3IgdkRQQQo+
IAo+ICAgICAgICAgb3IKPiAKPiAgICAgICAgIDIpIG9ubHkgZGV0ZWN0IHZEUEEgdmlhIGJ5cGFz
cyBtYW5hZ2VyPyAod2UgY2FuIGxlYXZlIFZGSU8gY29kZSBhcyBpcywgdGhlbgo+ICAgICAgICAg
dGhlIGFzc2lnbmVkIGRldmljZSBjb3VudGVyIG1heSBpbmNyZWFzZS9kZWNyZWFzZSB0d2ljZSBp
ZiBWRklPIHVzZSBpcnEKPiAgICAgICAgIGJ5cGFzcyBtYW5hZ2VyIHdoaWNoIHNob3VsZCBiZSBu
byBoYXJtKS4KPiAKPiAgICAgICAgIFRoYW5rcwo+IAo+ICAgICAyIGlzIHByb2JhYmx5IGVhc2ll
ciB0byBqdXN0aWZ5LiAxIHdvdWxkIGRlcGVuZCBvbiB0aGUgc3BlY2lmaWMgYnJpZGdlCj4gICAg
IHByb3Bvc2VkLgo+IAo+IFRoYW5rcyBNaWNoYWVsLCBzbyB3ZSBzaG91bGQganVzdCBkcm9wIGNo
YW5nZXMgaW4gdmZpbywganVzdCBpbmNyZWFzZSAvIGRlY3JlYXNlCj4gdGhlIGNvdW50ZXIgaW4g
aXJxIGJ5cGFzcyBtYW5hZ2VyLiByaWdodD8KPiAKPiBUaGFua3MKCkkgZG9uJ3Qgc2VlIGFueSBp
c3N1ZSB3aXRoIHRoYXQuCgo+IAo+IAo+ICAgICAgICAgICAgICAgICAtLS0KPiAgICAgICAgICAg
ICAgICAgICBhcmNoL3g4Ni9rdm0veDg2LmMgfCAxMCArKysrKysrKy0tCj4gICAgICAgICAgICAg
ICAgICAgdmlydC9rdm0vdmZpby5jICAgIHwgIDIgLS0KPiAgICAgICAgICAgICAgICAgICAyIGZp
bGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiAgICAgICAg
ICAgICAgICAgZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS94ODYuYyBiL2FyY2gveDg2L2t2bS94
ODYuYwo+ICAgICAgICAgICAgICAgICBpbmRleCAwMGM4OGMyLi4yMGMwN2QzIDEwMDY0NAo+ICAg
ICAgICAgICAgICAgICAtLS0gYS9hcmNoL3g4Ni9rdm0veDg2LmMKPiAgICAgICAgICAgICAgICAg
KysrIGIvYXJjaC94ODYva3ZtL3g4Ni5jCj4gICAgICAgICAgICAgICAgIEBAIC0xMDYyNCwxMSAr
MTA2MjQsMTcgQEAgaW50IGt2bV9hcmNoX2lycV9ieXBhc3NfYWRkX3Byb2R1Y2VyKHN0cnVjdCBp
cnFfYnlwYXNzX2NvbnN1bWVyICpjb25zLAo+ICAgICAgICAgICAgICAgICAgIHsKPiAgICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX2tlcm5lbF9pcnFmZCAqaXJxZmQgPQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGFpbmVyX29mKGNvbnMsIHN0cnVjdCBrdm1f
a2VybmVsX2lycWZkLCBjb25zdW1lcik7Cj4gICAgICAgICAgICAgICAgICsgICAgICAgaW50IHJl
dDsKPiAgICAgICAgICAgICAgICAgICAgICAgICBpcnFmZC0+cHJvZHVjZXIgPSBwcm9kOwo+ICAg
ICAgICAgICAgICAgICArICAgICAgIGt2bV9hcmNoX3N0YXJ0X2Fzc2lnbm1lbnQoaXJxZmQtPmt2
bSk7Cj4gICAgICAgICAgICAgICAgICsgICAgICAgcmV0ID0ga3ZtX3g4Nl9vcHMudXBkYXRlX3Bp
X2lydGUoaXJxZmQtPmt2bSwKPiAgICAgICAgICAgICAgICAgKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwcm9kLT5pcnEsIGlycWZkLT5nc2ksIDEpOwo+ICAgICAgICAg
ICAgICAgICArCj4gICAgICAgICAgICAgICAgICsgICAgICAgaWYgKHJldCkKPiAgICAgICAgICAg
ICAgICAgKyAgICAgICAgICAgICAgIGt2bV9hcmNoX2VuZF9hc3NpZ25tZW50KGlycWZkLT5rdm0p
Owo+ICAgICAgICAgICAgICAgICAtICAgICAgIHJldHVybiBrdm1feDg2X29wcy51cGRhdGVfcGlf
aXJ0ZShpcnFmZC0+a3ZtLAo+ICAgICAgICAgICAgICAgICAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcHJvZC0+aXJxLCBpcnFmZC0+Z3NpLCAxKTsKPiAgICAgICAg
ICAgICAgICAgKyAgICAgICByZXR1cm4gcmV0Owo+ICAgICAgICAgICAgICAgICAgIH0KPiAgICAg
ICAgICAgICAgICAgICB2b2lkIGt2bV9hcmNoX2lycV9ieXBhc3NfZGVsX3Byb2R1Y2VyKHN0cnVj
dCBpcnFfYnlwYXNzX2NvbnN1bWVyICpjb25zLAo+ICAgICAgICAgICAgICAgICBkaWZmIC0tZ2l0
IGEvdmlydC9rdm0vdmZpby5jIGIvdmlydC9rdm0vdmZpby5jCj4gICAgICAgICAgICAgICAgIGlu
ZGV4IDhmY2JjNTAuLjExMWRhNTIgMTAwNjQ0Cj4gICAgICAgICAgICAgICAgIC0tLSBhL3ZpcnQv
a3ZtL3ZmaW8uYwo+ICAgICAgICAgICAgICAgICArKysgYi92aXJ0L2t2bS92ZmlvLmMKPiAgICAg
ICAgICAgICAgICAgQEAgLTIyNiw3ICsyMjYsNiBAQCBzdGF0aWMgaW50IGt2bV92ZmlvX3NldF9n
cm91cChzdHJ1Y3Qga3ZtX2RldmljZSAqZGV2LCBsb25nIGF0dHIsIHU2NCBhcmcpCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBsaXN0X2FkZF90YWlsKCZrdmctPm5vZGUsICZrdi0+
Z3JvdXBfbGlzdCk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrdmctPnZmaW9f
Z3JvdXAgPSB2ZmlvX2dyb3VwOwo+ICAgICAgICAgICAgICAgICAtICAgICAgICAgICAgICAga3Zt
X2FyY2hfc3RhcnRfYXNzaWdubWVudChkZXYtPmt2bSk7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBtdXRleF91bmxvY2soJmt2LT5sb2NrKTsKPiAgICAgICAgICAgICAgICAgQEAg
LTI1NCw3ICsyNTMsNiBAQCBzdGF0aWMgaW50IGt2bV92ZmlvX3NldF9ncm91cChzdHJ1Y3Qga3Zt
X2RldmljZSAqZGV2LCBsb25nIGF0dHIsIHU2NCBhcmcpCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGxpc3RfZGVsKCZrdmctPm5vZGUpOwo+ICAgICAgICAgICAg
ICAgICAtICAgICAgICAgICAgICAgICAgICAgICBrdm1fYXJjaF9lbmRfYXNzaWdubWVudChkZXYt
Pmt2bSk7Cj4gICAgICAgICAgICAgICAgICAgI2lmZGVmIENPTkZJR19TUEFQUl9UQ0VfSU9NTVUK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga3ZtX3NwYXByX3RjZV9y
ZWxlYXNlX3ZmaW9fZ3JvdXAoZGV2LT5rdm0sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGt2Zy0+dmZpb19n
cm91cCk7Cj4gICAgICAgICAgICAgICAgIC0tCj4gICAgICAgICAgICAgICAgIDEuOC4zLjEKPiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxp
emF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92
aXJ0dWFsaXphdGlvbg==
