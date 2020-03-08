Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D257617D254
	for <lists.virtualization@lfdr.de>; Sun,  8 Mar 2020 08:58:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 27A21204BD;
	Sun,  8 Mar 2020 07:58:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TxgG0U-j3Yzc; Sun,  8 Mar 2020 07:58:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 88FDE20483;
	Sun,  8 Mar 2020 07:58:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C8D1C0177;
	Sun,  8 Mar 2020 07:58:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04626C0177
 for <virtualization@lists.linux-foundation.org>;
 Sun,  8 Mar 2020 07:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E277186DD4
 for <virtualization@lists.linux-foundation.org>;
 Sun,  8 Mar 2020 07:58:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DIYzsrKizGHO
 for <virtualization@lists.linux-foundation.org>;
 Sun,  8 Mar 2020 07:58:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9180C86DB4
 for <virtualization@lists.linux-foundation.org>;
 Sun,  8 Mar 2020 07:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583654293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/iQ3FcNLQi6DjD/zqwYipJZvlLCEPpHUkTbLpJbck20=;
 b=epTEvCJ+aneXSiVlVbGQ849E1QJeGlzYPTRzxYVUQz1VULvtHylB0W8hXzDxaak+Y/9HTQ
 II6HbsbvMnGcsztRfuj6K0xQPvF1E6+Wu9m1g1tofS8iPWufJNQBcJvQua7xBOPbpvY3ZM
 RLdM/bDH51PrQvMjiRr5sR1GEHGPmRI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-5J5-7LP9PrOFP2a-hAwyTw-1; Sun, 08 Mar 2020 03:58:11 -0400
X-MC-Unique: 5J5-7LP9PrOFP2a-hAwyTw-1
Received: by mail-qv1-f69.google.com with SMTP id r9so4633894qvs.19
 for <virtualization@lists.linux-foundation.org>;
 Sat, 07 Mar 2020 23:58:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/iQ3FcNLQi6DjD/zqwYipJZvlLCEPpHUkTbLpJbck20=;
 b=Hfz5C6cWkQ83cRtbaEg9yQIGRjfEPtXbkX04yJujw72l3FrX7terPHnJdE3JCFIKD6
 24MIrC4w1gV4d8T5J1fqiSHqUdU+vyeJT3KCjMEmVQZiz9QMSsDfF6IkxJCAmAc4vrgp
 0WmjHE2INASdO70Js7jYNy4oxqRLUqSCscwJKTEMi3183hppN10Ve/2tozpSVTC+zYno
 HENM/A1L7qz7qxYwy8PDLMD7zAuoD6bOZewZeV/jIlHE7tVkcz5KViOsohFV/cO3XOS9
 hi3mj4un/Hhf+ZkT3vP3S85MPOzucRikYi3kVLvlCRgWvEyHkqDgtCH7PSDwVpCNB8vn
 G+jQ==
X-Gm-Message-State: ANhLgQ0zivntSfmAq9E9yyP9i1LwaNSJhO4Gcrv0NYUnuwVIr1We0VHd
 7seTmLWV9Z9LjObgTE2HQJUxwVQhKrHmN6ylpyL5ptmCpbwNTDNmJ7cOGTsJUGnDbLh/ND5Nehq
 8QS9vYV44Swpt/Ht79f9LebSCV2y9dUEjMulWPLlQWg==
X-Received: by 2002:a0c:fc46:: with SMTP id w6mr10078464qvp.46.1583654290653; 
 Sat, 07 Mar 2020 23:58:10 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvvApe3sCEXq2f20G7j5KtC2UjY5EK9LLdWQ6XZXZsCsV5yGgnxLOyL/CYD4IMH7RPUgWBaWA==
X-Received: by 2002:a0c:fc46:: with SMTP id w6mr10078456qvp.46.1583654290419; 
 Sat, 07 Mar 2020 23:58:10 -0800 (PST)
Received: from redhat.com (bzq-79-178-2-19.red.bezeqint.net. [79.178.2.19])
 by smtp.gmail.com with ESMTPSA id f128sm20670117qke.54.2020.03.07.23.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2020 23:58:09 -0800 (PST)
Date: Sun, 8 Mar 2020 03:58:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH] virtio_ring: Fix mem leak with vring_new_virtqueue()
Message-ID: <20200308035751-mutt-send-email-mst@kernel.org>
References: <20200224212643.30672-1-s-anna@ti.com>
 <b622c831-9adb-b9af-dd4a-21605bc124a8@redhat.com>
 <0ace3a3b-cf2f-7977-5337-f74f530afbe1@ti.com>
 <1ce2bee4-64ed-f630-2695-8e8b9b8e27c1@redhat.com>
 <a4335428-e29e-d567-b18b-3c144020a726@ti.com>
MIME-Version: 1.0
In-Reply-To: <a4335428-e29e-d567-b18b-3c144020a726@ti.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 "David S. Miller" <davem@davemloft.net>
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

T24gVGh1LCBNYXIgMDUsIDIwMjAgYXQgMDY6Mjc6NTNQTSAtMDYwMCwgU3VtYW4gQW5uYSB3cm90
ZToKPiBPbiAyLzI1LzIwIDk6MTMgUE0sIEphc29uIFdhbmcgd3JvdGU6Cj4gPiAKPiA+IE9uIDIw
MjAvMi8yNiDkuIrljYgxMjo1MSwgU3VtYW4gQW5uYSB3cm90ZToKPiA+PiBIaSBKYXNvbiwKPiA+
Pgo+ID4+IE9uIDIvMjQvMjAgMTE6MzkgUE0sIEphc29uIFdhbmcgd3JvdGU6Cj4gPj4+IE9uIDIw
MjAvMi8yNSDkuIrljYg1OjI2LCBTdW1hbiBBbm5hIHdyb3RlOgo+ID4+Pj4gVGhlIGZ1bmN0aW9u
cyB2cmluZ19uZXdfdmlydHF1ZXVlKCkgYW5kIF9fdnJpbmdfbmV3X3ZpcnRxdWV1ZSgpIGFyZQo+
ID4+Pj4gdXNlZAo+ID4+Pj4gd2l0aCBzcGxpdCByaW5ncywgYW5kIGFueSBhbGxvY2F0aW9ucyB3
aXRoaW4gdGhlc2UgZnVuY3Rpb25zIGFyZQo+ID4+Pj4gbWFuYWdlZAo+ID4+Pj4gb3V0c2lkZSBv
ZiB0aGUgLndlX293bl9yaW5nIGZsYWcuIFRoZSBjb21taXQgY2JlZWRiNzJiOTdhCj4gPj4+PiAo
InZpcnRpb19yaW5nOgo+ID4+Pj4gYWxsb2NhdGUgZGVzYyBzdGF0ZSBmb3Igc3BsaXQgcmluZyBz
ZXBhcmF0ZWx5IikgYWxsb2NhdGVzIHRoZSBkZXNjCj4gPj4+PiBzdGF0ZQo+ID4+Pj4gd2l0aGlu
IHRoZSBfX3ZyaW5nX25ld192aXJ0cXVldWUoKSBidXQgZnJlZXMgaXQgb25seSB3aGVuIHRoZQo+
ID4+Pj4gLndlX293bl9yaW5nCj4gPj4+PiBmbGFnIGlzIHNldC4gVGhpcyBsZWFkcyB0byBhIG1l
bW9yeSBsZWFrIHdoZW4gZnJlZWluZyBzdWNoIGFsbG9jYXRlZAo+ID4+Pj4gdmlydHF1ZXVlcyB3
aXRoIHRoZSB2cmluZ19kZWxfdmlydHF1ZXVlKCkgZnVuY3Rpb24uCj4gPj4+Pgo+ID4+Pj4gRml4
IHRoaXMgYnkgbW92aW5nIHRoZSBkZXNjX3N0YXRlIGZyZWUgY29kZSBvdXRzaWRlIHRoZSBmbGFn
IGFuZCBvbmx5Cj4gPj4+PiBmb3Igc3BsaXQgcmluZ3MuIElzc3VlIHdhcyBkaXNjb3ZlcmVkIGR1
cmluZyB0ZXN0aW5nIHdpdGggcmVtb3RlcHJvYwo+ID4+Pj4gYW5kIHZpcnRpb19ycG1zZy4KPiA+
Pj4+Cj4gPj4+PiBGaXhlczogY2JlZWRiNzJiOTdhICgidmlydGlvX3Jpbmc6IGFsbG9jYXRlIGRl
c2Mgc3RhdGUgZm9yIHNwbGl0IHJpbmcKPiA+Pj4+IHNlcGFyYXRlbHkiKQo+ID4+Pj4gU2lnbmVk
LW9mZi1ieTogU3VtYW4gQW5uYTxzLWFubmFAdGkuY29tPgo+ID4+Pj4gLS0tCj4gPj4+PiDCoMKg
IGRyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMgfCA0ICsrLS0KPiA+Pj4+IMKgwqAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Pj4+Cj4gPj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYwo+ID4+Pj4gYi9kcml2ZXJz
L3ZpcnRpby92aXJ0aW9fcmluZy5jCj4gPj4+PiBpbmRleCA4NjdjN2ViZDNmMTAuLjU4Yjk2YmFh
OGQ0OCAxMDA2NDQKPiA+Pj4+IC0tLSBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMKPiA+
Pj4+ICsrKyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMKPiA+Pj4+IEBAIC0yMjAzLDEw
ICsyMjAzLDEwIEBAIHZvaWQgdnJpbmdfZGVsX3ZpcnRxdWV1ZShzdHJ1Y3QgdmlydHF1ZXVlICpf
dnEpCj4gPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHZxLT5zcGxpdC5xdWV1ZV9zaXplX2luX2J5dGVzLAo+ID4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2cS0+c3BsaXQudnJpbmcuZGVzYywKPiA+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdnEtPnNwbGl0
LnF1ZXVlX2RtYV9hZGRyKTsKPiA+Pj4+IC0KPiA+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGtmcmVlKHZxLT5zcGxpdC5kZXNjX3N0YXRlKTsKPiA+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
IH0KPiA+Pj4+IMKgwqDCoMKgwqDCoCB9Cj4gPj4+PiArwqDCoMKgIGlmICghdnEtPnBhY2tlZF9y
aW5nKQo+ID4+Pj4gK8KgwqDCoMKgwqDCoMKgIGtmcmVlKHZxLT5zcGxpdC5kZXNjX3N0YXRlKTsK
PiA+Pj4gTml0cGljaywgaXQgbG9va3MgdG8gbWUgaXQgd291bGQgYmUgbW9yZSBjbGVhciBpZiB3
ZSBqdXN0IGZyZWUKPiA+Pj4gZGVzY19zdGF0ZSB1bmNvbmRpdGlvbmFsbHkgaGVyZSAoYW5kIHJl
bW92ZSB0aGUga2ZyZWUgZm9yIHBhY2tlZCBhYm92ZSkuCj4gPj4gT0ssIGFyZSB5b3Ugc3VyZSB5
b3Ugd2FudCB0aGF0IHRvIGJlIGZvbGRlZCBpbnRvIHRoaXMgcGF0Y2g/IEl0IGxvb2tzIHRvCj4g
Pj4gbWUgYSBzZXBhcmF0ZSBjbGVhbnVwL2NvbnNvbGlkYXRpb24gcGF0Y2gsIGFuZCBwYWNrZWQg
ZGVzY19zdGF0ZSBkb2VzCj4gPj4gbm90IHN1ZmZlciB0aGlzIG1lbWxlYWssIGFuZCBuZWVkIG5v
dCBiZSBiYWNrcG9ydGVkIGludG8gc3RhYmxlIGtlcm5lbHMuCj4gPj4KPiA+PiByZWdhcmRzCj4g
Pj4gU3VtYW4KPiA+IAo+ID4gCj4gPiBUaG91Z2ggaXQncyBqdXN0IGEgc21hbGwgdHdlYWssIEkn
bSBmaW5lIGZvciBsZWF2aW5nIGl0IGZvciBmdXR1cmUuCj4gPiAKPiA+IFNvCj4gPiAKPiA+IEFj
a2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+ID4gCj4gCj4gTWlrZSwK
PiBQaW5nIG9uIHRoaXMuIEkgZG9uJ3Qgc2VlIHRoZSBwYXRjaCBpbiAtbmV4dCB5ZXQuIENhbiB3
ZSBnZXQgdGhpcyBpbnRvCj4gdGhlIGN1cnJlbnQgLXJjIHBsZWFzZT8KPiAKPiByZWdhcmRzCj4g
U3VtYW4KClllcyB3aWxsIHF1ZXVlIGl0IHNob3J0bHksIHRoYW5rcyEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
