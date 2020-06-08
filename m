Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A8B1F1571
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 11:32:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 67EAC861A0;
	Mon,  8 Jun 2020 09:31:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nceAHD30j6rD; Mon,  8 Jun 2020 09:31:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A1FC2861B2;
	Mon,  8 Jun 2020 09:31:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78EF7C016F;
	Mon,  8 Jun 2020 09:31:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9252EC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 757E22051B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:31:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RjQeUppL08Zy
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:31:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id EAF362051A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591608714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LNvKSHGcNFpoKloJv9CTa41fupcZYOPp955NFOVf5iE=;
 b=Rm4mAtblHdS2vpn3+SlI4ZBv1MTosFJA0Xt8CuhESAitfj2fWvgEP7Z5Fhp/5RGJF29biY
 HTn3waWu9LqVk6erOlZtckaJUFsyQ/zsIPnQmtIDgWRxenfR42T30wXELQylSFYjXiSOjF
 kzNeHaKgV5xAcsAy5w5lnJfAOXsQi14=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-m3AJvGIWPs2wAdgbfY0JXQ-1; Mon, 08 Jun 2020 05:31:53 -0400
X-MC-Unique: m3AJvGIWPs2wAdgbfY0JXQ-1
Received: by mail-wr1-f70.google.com with SMTP id w16so6895386wru.18
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Jun 2020 02:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LNvKSHGcNFpoKloJv9CTa41fupcZYOPp955NFOVf5iE=;
 b=WJBmH4scaIvUnYoYVmEz+LA+ejE5bVJi8IA/rCe+a/9BJUeHsYauPFnWG/ybT1hZbf
 9zsR8l0rs501cqWCfrJOHH+8MPAk4kVjrGYXfnkzrj3behMKt0eIfEiB5hYe4eGd78M+
 8UL1tONxdPHAozuSRjdhZ4Preev1CWlund7dbIy1hUTnBHj8tvPTb+FWW26BW48az6hH
 Fns40hhTAVqbGY2QoytUhv4En/LBkID27LhI0kXdPImqcIw9hf3X4+GTJE1i0jIf7yGW
 XK098wLs9nTeBa+0hxtBeOWfnAuiY/OzzZ5e5yUJUCNGmJUZbYnvgpFDxb8kJCWPb5ai
 08sA==
X-Gm-Message-State: AOAM531Gytox+qcip9TafGxVbb4FBbZno83imfzkSdbPn94uO+nWAc0h
 yPrs3a6JSmSeVHjxaD7UMrH0IUigMgwu9+A0z6ALMYaBFgg2JTQUTTwiYRUQhtqDk24Mi0Oep+f
 DZXcmSlcYU5aLbAj53wl3KXS4IDsazrppYZFDdmf3Mw==
X-Received: by 2002:a1c:2d4b:: with SMTP id t72mr10264719wmt.105.1591608712038; 
 Mon, 08 Jun 2020 02:31:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrW5kFnoqZJwp6PoFmC2wBk4W6FEbW+539vCJi8Cp1MLsFQDk07bfCq2UDoydOIUKxhQvvGw==
X-Received: by 2002:a1c:2d4b:: with SMTP id t72mr10264699wmt.105.1591608711808; 
 Mon, 08 Jun 2020 02:31:51 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 c65sm22564342wme.8.2020.06.08.02.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 02:31:51 -0700 (PDT)
Date: Mon, 8 Jun 2020 05:31:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 5/6] vdpa: introduce virtio pci driver
Message-ID: <20200608052041-mutt-send-email-mst@kernel.org>
References: <20200529080303.15449-1-jasowang@redhat.com>
 <20200529080303.15449-6-jasowang@redhat.com>
 <20200602010332-mutt-send-email-mst@kernel.org>
 <5dbb0386-beeb-5bf4-d12e-fb5427486bb8@redhat.com>
 <6b1d1ef3-d65e-08c2-5b65-32969bb5ecbc@redhat.com>
 <20200607095012-mutt-send-email-mst@kernel.org>
 <9b1abd2b-232c-aa0f-d8bb-03e65fd47de2@redhat.com>
 <20200608021438-mutt-send-email-mst@kernel.org>
 <a1b1b7fb-b097-17b7-2e3a-0da07d2e48ae@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a1b1b7fb-b097-17b7-2e3a-0da07d2e48ae@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: shahafs@mellanox.com, lulu@redhat.com, kvm@vger.kernel.org,
 saugatm@xilinx.com, netdev@vger.kernel.org, mhabets@solarflare.com,
 vmireyno@marvell.com, linux-kernel@vger.kernel.org, gdawar@xilinx.com,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 hanand@xilinx.com, zhangweining@ruijie.com.cn, eli@mellanox.com,
 lingshan.zhu@intel.com, rob.miller@broadcom.com
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

T24gTW9uLCBKdW4gMDgsIDIwMjAgYXQgMDU6MTg6NDRQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzYvOCDkuIvljYgyOjMyLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
Cj4gPiBPbiBNb24sIEp1biAwOCwgMjAyMCBhdCAxMTozMjozMUFNICswODAwLCBKYXNvbiBXYW5n
IHdyb3RlOgo+ID4gPiBPbiAyMDIwLzYvNyDkuIvljYg5OjUxLCBNaWNoYWVsIFMuIFRzaXJraW4g
d3JvdGU6Cj4gPiA+ID4gT24gRnJpLCBKdW4gMDUsIDIwMjAgYXQgMDQ6NTQ6MTdQTSArMDgwMCwg
SmFzb24gV2FuZyB3cm90ZToKPiA+ID4gPiA+IE9uIDIwMjAvNi8yIOS4i+WNiDM6MDgsIEphc29u
IFdhbmcgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2
aWNlX2lkIHZwX3ZkcGFfaWRfdGFibGVbXSA9IHsKPiA+ID4gPiA+ID4gPiA+ICvCoMKgwqAgeyBQ
Q0lfREVWSUNFKFBDSV9WRU5ET1JfSURfUkVESEFUX1FVTVJBTkVULCBQQ0lfQU5ZX0lEKSB9LAo+
ID4gPiA+ID4gPiA+ID4gK8KgwqDCoCB7IDAgfQo+ID4gPiA+ID4gPiA+ID4gK307Cj4gPiA+ID4g
PiA+ID4gVGhpcyBsb29rcyBsaWtlIGl0J2xsIGNyZWF0ZSBhIG1lc3Mgd2l0aCBlaXRoZXIgdmly
dGlvIHBjaQo+ID4gPiA+ID4gPiA+IG9yIHZkcGEgYmVpbmcgbG9hZGVkIGF0IHJhbmRvbS4gTWF5
YmUganVzdCBkb24ndCBzcGVjaWZ5Cj4gPiA+ID4gPiA+ID4gYW55IElEcyBmb3Igbm93LiBEb3du
IHRoZSByb2FkIHdlIGNvdWxkIGdldCBhCj4gPiA+ID4gPiA+ID4gZGlzdGluY3QgdmVuZG9yIElE
IG9yIGEgcmFuZ2Ugb2YgZGV2aWNlIElEcyBmb3IgdGhpcy4KPiA+ID4gPiA+ID4gUmlnaHQsIHdp
bGwgZG8uCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBUaGFua3MKPiA+ID4gPiA+IFJldGhpbmsg
YWJvdXQgdGhpcy4gSWYgd2UgZG9uJ3Qgc3BlY2lmeSBhbnkgSUQsIHRoZSBiaW5kaW5nIHdvbid0
IHdvcmsuCj4gPiA+ID4gV2UgY2FuIGJpbmQgbWFudWFsbHkuIEl0J3Mgbm90IHJlYWxseSBmb3Ig
cHJvZHVjdGlvbiBhbnl3YXksIHNvCj4gPiA+ID4gbm90IGEgYmlnIGRlYWwgaW1oby4KPiA+ID4g
Cj4gPiA+IEkgdGhpbmsgeW91IG1lYW4gZG9pbmcgaXQgdmlhICJuZXdfaWQiLCByaWdodC4KPiA+
IEkgcmVhbGx5IG1lYW50IGRyaXZlcl9vdmVycmlkZS4gVGhpcyBpcyB3aGF0IHBlb3BsZSBoYXZl
IGJlZW4gdXNpbmcKPiA+IHdpdGggcGNpLXN0dWIgZm9yIHllYXJzIG5vdy4KPiAKPiAKPiBEbyB5
b3Ugd2FudCBtZSB0byBpbXBsZW1lbnQgImRyaXZlcl9vdmVycmlkIiBpbiB0aGlzIHNlcmllcywg
b3IgYSBOVUxMCj4gaWRfdGFibGUgaXMgc3VmZmljaWVudD8KCgpEb2Vzbid0IHRoZSBwY2kgc3Vi
c3lzdGVtIGNyZWF0ZSBkcml2ZXJfb3ZlcnJpZGUgZm9yIGFsbCBkZXZpY2VzCm9uIHRoZSBwY2kg
YnVzPwoKPiAKPiA+IAo+ID4gPiA+ID4gSG93IGFib3V0IHVzaW5nIGEgZGVkaWNhdGVkIHN1YnN5
c3RlbSB2ZW5kb3IgaWQgZm9yIHRoaXM/Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoYW5rcwo+ID4g
PiA+IElmIHZpcnRpbyB2ZW5kb3IgaWQgaXMgdXNlZCB0aGVuIHN0YW5kYXJkIGRyaXZlciBpcyBl
eHBlY3RlZAo+ID4gPiA+IHRvIGJpbmQsIHJpZ2h0PyBNYXliZSB1c2UgYSBkZWRpY2F0ZWQgdmVu
ZG9yIGlkPwo+ID4gPiAKPiA+ID4gSSBtZWFudCBzb21ldGhpbmcgbGlrZToKPiA+ID4gCj4gPiA+
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCB2cF92ZHBhX2lkX3RhYmxlW10gPSB7
Cj4gPiA+ICDCoMKgwqAgeyBQQ0lfREVWSUNFX1NVQihQQ0lfVkVORE9SX0lEX1JFREhBVF9RVU1S
QU5FVCwgUENJX0FOWV9JRCwKPiA+ID4gVlBfVEVTVF9WRU5ET1JfSUQsIFZQX1RFU1RfREVWSUNF
X0lEKSB9LAo+ID4gPiAgwqDCoMKgIHsgMCB9Cj4gPiA+IH07Cj4gPiA+IAo+ID4gPiBUaGFua3MK
PiA+ID4gCj4gPiBUaGVuIHJlZ3VsYXIgdmlydGlvIHdpbGwgc3RpbGwgYmluZCB0byBpdC4gSXQg
aGFzCj4gPiAKPiA+IGRyaXZlcnMvdmlydGlvL3ZpcnRpb19wY2lfY29tbW9uLmM6ICAgICB7IFBD
SV9ERVZJQ0UoUENJX1ZFTkRPUl9JRF9SRURIQVRfUVVNUkFORVQsIFBDSV9BTllfSUQpIH0sCj4g
PiAKPiA+IAo+IAo+IElGQ1ZGIHVzZSB0aGlzIHRvIGF2b2lkIHRoZSBiaW5kaW5nIHRvIHJlZ3Vs
YXIgdmlydGlvIGRldmljZS4KCgpPdy4gSW5kZWVkOgoKI2RlZmluZSBJRkNWRl9WRU5ET1JfSUQg
ICAgICAgICAweDFBRjQKCldoaWNoIGlzIG9mIGNvdXJzZSBub3QgYW4gSUZDVkYgdmVuZG9yIGlk
LCBpdCdzIHRoZSBSZWQgSGF0IHZlbmRvciBJRC4KCkkgbWlzc2VkIHRoYXQuCgpEb2VzIGl0IGFj
dHVhbGx5IHdvcmsgaWYgeW91IGJpbmQgYSB2aXJ0aW8gZHJpdmVyIHRvIGl0PwpJJ20gZ3Vlc3Np
bmcgbm8gb3RoZXJ3aXNlIHRoZXkgd291bGRuJ3QgbmVlZCBJRkMgZHJpdmVyLCByaWdodD8KCgoK
Cj4gTG9va2luZyBhdAo+IHBjaV9tYXRjaF9vbmVfZGV2aWNlKCkgaXQgY2hlY2tzIGJvdGggc3Vi
dmVuZG9yIGFuZCBzdWJkZXZpY2UgdGhlcmUuCj4gCj4gVGhhbmtzCgoKQnV0IElJVUMgdGhlcmUg
aXMgbm8gZ3VhcmFudGVlIHRoYXQgZHJpdmVyIHdpdGggYSBzcGVjaWZpYyBzdWJ2ZW5kb3IKbWF0
Y2hlcyBpbiBwcmVzZW5jZSBvZiBhIGdlbmVyaWMgb25lLgpTbyBlaXRoZXIgSUZDIG9yIHZpcnRp
byBwY2kgY2FuIHdpbiwgd2hpY2hldmVyIGJpbmRzIGZpcnN0LgoKSSBndWVzcyB3ZSBuZWVkIHRv
IGJsYWNrbGlzdCBJRkMgaW4gdmlydGlvIHBjaSBwcm9iZSBjb2RlLiBVZ2guCgotLSAKTVNUCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
