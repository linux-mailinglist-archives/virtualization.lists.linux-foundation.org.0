Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAED21D403
	for <lists.virtualization@lfdr.de>; Mon, 13 Jul 2020 12:53:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7BC8788B29;
	Mon, 13 Jul 2020 10:53:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FzGG+jG+SLLY; Mon, 13 Jul 2020 10:53:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A65B4888D7;
	Mon, 13 Jul 2020 10:53:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8AE78C0733;
	Mon, 13 Jul 2020 10:53:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB162C0733
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 10:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DF7C7871E5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 10:53:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DaCk9xEHm-da
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 10:53:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0F67B8716A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 10:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594637579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K2BTuXqkytux8nGd8zFoddd/yDMYv3cynNJyiItMdOQ=;
 b=DsB6lanIX0tUU4hcuyoGfafSpv8bHpFpRoqbdhfB1mPLtttMdOI8+bbfBuavT24Px04loC
 LvVhboE69cBjs9RuX5LdgRNS2e5NIQc27uAP545DStm8cq/mHXO2LMqBqQs+DO8RpSe0TU
 A/iXVgT5kyKxF7mpGo5RrU3ACSusbnY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-JKrBnOIhMm2tknmCxUUzFQ-1; Mon, 13 Jul 2020 06:52:58 -0400
X-MC-Unique: JKrBnOIhMm2tknmCxUUzFQ-1
Received: by mail-wr1-f69.google.com with SMTP id d11so17340137wrw.12
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 03:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=K2BTuXqkytux8nGd8zFoddd/yDMYv3cynNJyiItMdOQ=;
 b=bU6finWpxDGjBL/rKLl06QUlGL59x6TM8BaVjZdGbJiR933qqbyM/mo4OYW4Hzx6rU
 7Dxn1Cf5YhHdhmBQEX57kW813cNYPvLJYZ5Tv6HAVEnhZ4OhXTyZyCdQnqbtSjetm8Yo
 tSCPnYlTih80fo0Tfyle/lxfDaCl2Gw/dkxPmMrYWnpNmFLZQLOt9aDgLBf8ReCb2k6c
 aAqRbu9+UTOkROFEM+jKIvUKUMBpPiavHqBIRXsZyfq89OXnf4z2KICeyJ7R+d2SUorR
 AwG+DVDPnIYZhZ6qYW+JhmWG6eaVZ5F3vSw8TsQm3/lEGtKHewG4uQGAtsy3TMSDZyMY
 7NRg==
X-Gm-Message-State: AOAM53352sXjAaenUv22TkLDP6UV8i5F7sQnZOAG2CmB+EsrjEsXh15J
 KebNJ3k8mUKV5pcR9A0nUuJFTYBqq7/apVWUimZLraMcosCltVSLY59FC4eehL7ey/q9D/mIe4J
 QtOHKIQAAzROLwQ6MlIqlmPGXz1PI31KUh++wxzJmBA==
X-Received: by 2002:a5d:4591:: with SMTP id p17mr79419835wrq.343.1594637577041; 
 Mon, 13 Jul 2020 03:52:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVrPQrZLdPMoFP6Y7+3Bf29Fby18L0+X5fsE636sDnhwo/yCifhnwCRzf6ZJqCB//RlrCvBA==
X-Received: by 2002:a5d:4591:: with SMTP id p17mr79419819wrq.343.1594637576842; 
 Mon, 13 Jul 2020 03:52:56 -0700 (PDT)
Received: from redhat.com (bzq-79-180-10-140.red.bezeqint.net. [79.180.10.140])
 by smtp.gmail.com with ESMTPSA id i6sm11748360wrp.92.2020.07.13.03.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 03:52:56 -0700 (PDT)
Date: Mon, 13 Jul 2020 06:52:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 2/7] kvm/vfio: detect assigned device via irqbypass manager
Message-ID: <20200713065222-mutt-send-email-mst@kernel.org>
References: <1594565366-3195-1-git-send-email-lingshan.zhu@intel.com>
 <1594565366-3195-2-git-send-email-lingshan.zhu@intel.com>
 <20200712170518-mutt-send-email-mst@kernel.org>
 <bcb03e95-d8b9-6e19-5b0e-0119d3f43d6d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bcb03e95-d8b9-6e19-5b0e-0119d3f43d6d@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: wanpengli@tencent.com, kvm@vger.kernel.org, netdev@vger.kernel.org,
 sean.j.christopherson@intel.com, virtualization@lists.linux-foundation.org,
 pbonzini@redhat.com, Zhu Lingshan <lingshan.zhu@intel.com>
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

T24gTW9uLCBKdWwgMTMsIDIwMjAgYXQgMDQ6MTM6MzVQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzcvMTMg5LiK5Y2INTowNiwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gU3VuLCBKdWwgMTIsIDIwMjAgYXQgMTA6NDk6MjFQTSArMDgwMCwgWmh1IExpbmdz
aGFuIHdyb3RlOgo+ID4gPiBXZSB1c2VkIHRvIGRldGVjdCBhc3NpZ25lZCBkZXZpY2UgdmlhIFZG
SU8gbWFuaXB1bGF0ZWQgZGV2aWNlCj4gPiA+IGNvbnRlcnMuIFRoaXMgaXMgbGVzcyBmbGV4aWJs
ZSBjb25zaWRlciBWRklPIGlzIG5vdCB0aGUgb25seQo+ID4gPiBpbnRlcmZhY2UgZm9yIGFzc2ln
bmVkIGRldmljZS4gdkRQQSBkZXZpY2VzIGhhcyBkZWRpY2F0ZWQKPiA+ID4gYmFja2VkIGhhcmR3
YXJlIGFzIHdlbGwuIFNvIHRoaXMgcGF0Y2ggdHJpZXMgdG8gZGV0ZWN0Cj4gPiA+IHRoZSBhc3Np
Z25lZCBkZXZpY2UgdmlhIGlycWJ5cGFzcyBtYW5hZ2VyLgo+ID4gPiAKPiA+ID4gV2Ugd2lsbCBp
bmNyZWFzZS9kZWNyZWFzZSB0aGUgYXNzaWduZWQgZGV2aWNlIGNvdW50ZXIgaW4ga3ZtL3g4Ni4K
PiA+ID4gQm90aCB2RFBBIGFuZCBWRklPIHdvdWxkIGdvIHRocm91Z2ggdGhpcyBjb2RlIHBhdGgu
Cj4gPiA+IAo+ID4gPiBUaGlzIGNvZGUgcGF0aCBvbmx5IGFmZmVjdCB4ODYgZm9yIG5vdy4KPiA+
ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFpodSBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVs
LmNvbT4KPiA+IAo+ID4gSSB0aGluayBpdCdzIGJlc3QgdG8gbGVhdmUgVkZJTyBhbG9uZS4gQWRk
IGFwcHJvcHJpYXRlIEFQSXMgZm9yIFZEUEEsCj4gPiB3b3JyeSBhYm91dCBjb252ZXJ0aW5nIGV4
aXN0aW5nIHVzZXJzIGxhdGVyLgo+IAo+IAo+IAo+IEp1c3QgdG8gbWFrZSBzdXJlIEkgdW5kZXJz
dGFuZCwgZGlkIHlvdSBtZWFuOgo+IAo+IDEpIGludHJvZHVjZSBhbm90aGVyIGJyaWRnZSBmb3Ig
dkRQQQo+IAo+IG9yCj4gCj4gMikgb25seSBkZXRlY3QgdkRQQSB2aWEgYnlwYXNzIG1hbmFnZXI/
ICh3ZSBjYW4gbGVhdmUgVkZJTyBjb2RlIGFzIGlzLCB0aGVuCj4gdGhlIGFzc2lnbmVkIGRldmlj
ZSBjb3VudGVyIG1heSBpbmNyZWFzZS9kZWNyZWFzZSB0d2ljZSBpZiBWRklPIHVzZSBpcnEKPiBi
eXBhc3MgbWFuYWdlciB3aGljaCBzaG91bGQgYmUgbm8gaGFybSkuCj4gCj4gVGhhbmtzCgoyIGlz
IHByb2JhYmx5IGVhc2llciB0byBqdXN0aWZ5LiAxIHdvdWxkIGRlcGVuZCBvbiB0aGUgc3BlY2lm
aWMgYnJpZGdlCnByb3Bvc2VkLgoKPiAKPiA+IAo+ID4gPiAtLS0KPiA+ID4gICBhcmNoL3g4Ni9r
dm0veDg2LmMgfCAxMCArKysrKysrKy0tCj4gPiA+ICAgdmlydC9rdm0vdmZpby5jICAgIHwgIDIg
LS0KPiA+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0veDg2LmMgYi9hcmNoL3g4
Ni9rdm0veDg2LmMKPiA+ID4gaW5kZXggMDBjODhjMi4uMjBjMDdkMyAxMDA2NDQKPiA+ID4gLS0t
IGEvYXJjaC94ODYva3ZtL3g4Ni5jCj4gPiA+ICsrKyBiL2FyY2gveDg2L2t2bS94ODYuYwo+ID4g
PiBAQCAtMTA2MjQsMTEgKzEwNjI0LDE3IEBAIGludCBrdm1fYXJjaF9pcnFfYnlwYXNzX2FkZF9w
cm9kdWNlcihzdHJ1Y3QgaXJxX2J5cGFzc19jb25zdW1lciAqY29ucywKPiA+ID4gICB7Cj4gPiA+
ICAgCXN0cnVjdCBrdm1fa2VybmVsX2lycWZkICppcnFmZCA9Cj4gPiA+ICAgCQljb250YWluZXJf
b2YoY29ucywgc3RydWN0IGt2bV9rZXJuZWxfaXJxZmQsIGNvbnN1bWVyKTsKPiA+ID4gKwlpbnQg
cmV0Owo+ID4gPiAgIAlpcnFmZC0+cHJvZHVjZXIgPSBwcm9kOwo+ID4gPiArCWt2bV9hcmNoX3N0
YXJ0X2Fzc2lnbm1lbnQoaXJxZmQtPmt2bSk7Cj4gPiA+ICsJcmV0ID0ga3ZtX3g4Nl9vcHMudXBk
YXRlX3BpX2lydGUoaXJxZmQtPmt2bSwKPiA+ID4gKwkJCQkJIHByb2QtPmlycSwgaXJxZmQtPmdz
aSwgMSk7Cj4gPiA+ICsKPiA+ID4gKwlpZiAocmV0KQo+ID4gPiArCQlrdm1fYXJjaF9lbmRfYXNz
aWdubWVudChpcnFmZC0+a3ZtKTsKPiA+ID4gLQlyZXR1cm4ga3ZtX3g4Nl9vcHMudXBkYXRlX3Bp
X2lydGUoaXJxZmQtPmt2bSwKPiA+ID4gLQkJCQkJICAgcHJvZC0+aXJxLCBpcnFmZC0+Z3NpLCAx
KTsKPiA+ID4gKwlyZXR1cm4gcmV0Owo+ID4gPiAgIH0KPiA+ID4gICB2b2lkIGt2bV9hcmNoX2ly
cV9ieXBhc3NfZGVsX3Byb2R1Y2VyKHN0cnVjdCBpcnFfYnlwYXNzX2NvbnN1bWVyICpjb25zLAo+
ID4gPiBkaWZmIC0tZ2l0IGEvdmlydC9rdm0vdmZpby5jIGIvdmlydC9rdm0vdmZpby5jCj4gPiA+
IGluZGV4IDhmY2JjNTAuLjExMWRhNTIgMTAwNjQ0Cj4gPiA+IC0tLSBhL3ZpcnQva3ZtL3ZmaW8u
Ywo+ID4gPiArKysgYi92aXJ0L2t2bS92ZmlvLmMKPiA+ID4gQEAgLTIyNiw3ICsyMjYsNiBAQCBz
dGF0aWMgaW50IGt2bV92ZmlvX3NldF9ncm91cChzdHJ1Y3Qga3ZtX2RldmljZSAqZGV2LCBsb25n
IGF0dHIsIHU2NCBhcmcpCj4gPiA+ICAgCQlsaXN0X2FkZF90YWlsKCZrdmctPm5vZGUsICZrdi0+
Z3JvdXBfbGlzdCk7Cj4gPiA+ICAgCQlrdmctPnZmaW9fZ3JvdXAgPSB2ZmlvX2dyb3VwOwo+ID4g
PiAtCQlrdm1fYXJjaF9zdGFydF9hc3NpZ25tZW50KGRldi0+a3ZtKTsKPiA+ID4gICAJCW11dGV4
X3VubG9jaygma3YtPmxvY2spOwo+ID4gPiBAQCAtMjU0LDcgKzI1Myw2IEBAIHN0YXRpYyBpbnQg
a3ZtX3ZmaW9fc2V0X2dyb3VwKHN0cnVjdCBrdm1fZGV2aWNlICpkZXYsIGxvbmcgYXR0ciwgdTY0
IGFyZykKPiA+ID4gICAJCQkJY29udGludWU7Cj4gPiA+ICAgCQkJbGlzdF9kZWwoJmt2Zy0+bm9k
ZSk7Cj4gPiA+IC0JCQlrdm1fYXJjaF9lbmRfYXNzaWdubWVudChkZXYtPmt2bSk7Cj4gPiA+ICAg
I2lmZGVmIENPTkZJR19TUEFQUl9UQ0VfSU9NTVUKPiA+ID4gICAJCQlrdm1fc3BhcHJfdGNlX3Jl
bGVhc2VfdmZpb19ncm91cChkZXYtPmt2bSwKPiA+ID4gICAJCQkJCQkJIGt2Zy0+dmZpb19ncm91
cCk7Cj4gPiA+IC0tIAo+ID4gPiAxLjguMy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6
YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
