Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 611D81F0B89
	for <lists.virtualization@lfdr.de>; Sun,  7 Jun 2020 15:57:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 18D008786C;
	Sun,  7 Jun 2020 13:57:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9t6IkZ3osAQh; Sun,  7 Jun 2020 13:57:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D822887818;
	Sun,  7 Jun 2020 13:57:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B46C3C016F;
	Sun,  7 Jun 2020 13:57:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6BD1C016F
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 13:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E27C787818
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 13:57:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UCYmVpjIdos1
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 13:57:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D3939877E2
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 13:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591538236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vfoj+F+YdFYc+88chRAUvS2eMr2A8z0PiugZ6+kTuqY=;
 b=aTNdTtFtlI41bsnvuOuN8Nnyxq+su1pqF7+UVg5BHpyuEq5RipDkxzmWmGolOg2RfxV3RF
 HcgzbQI8pKU23macPwQHAH3CWJKXREytYA1snNXvsgRWWxawUjkPq/vokmyUCC6HuWmrra
 HDwoIdOHeIZqDvMz4/Tya5Er+ae+r2s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-jDV03Y_nNWea3k6Nr7NNRA-1; Sun, 07 Jun 2020 09:57:14 -0400
X-MC-Unique: jDV03Y_nNWea3k6Nr7NNRA-1
Received: by mail-wm1-f70.google.com with SMTP id p24so4279758wmc.1
 for <virtualization@lists.linux-foundation.org>;
 Sun, 07 Jun 2020 06:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Vfoj+F+YdFYc+88chRAUvS2eMr2A8z0PiugZ6+kTuqY=;
 b=ew5AQRzDZDKjf1gdgBATxzHv5o2KtiVNKZq3p/9Ng02pD6oBJuyBOY1tkA+CLFSmn4
 yH101Sn0RCjkd8XOUemS7UrVL5ecO+kYZac0elsd3wdl7MNhc9FNd2FInk1wxi13GWjz
 3Gxv5lPO1GVQ1gV1ZvSUOsWBBrLAthysnu+FEnQ7MA5BoE06+CRSIhwT0Y762UAf/te4
 aHssOHdE0fnLuka71HVlUxmyznfaG6n46vNPgunMPbphytWeCqaBX5dAsnpaG+MGDGyu
 fQXriOGGazid7HcLbxwYl4DoDbEoFTqRaSKVpWLIxSuXw/mnsMnii2f9wSmpSBq96mae
 8+Dw==
X-Gm-Message-State: AOAM532JdVTpMrkbvN4NEcoqImxUjmW9yE2Sd87BURJlTYcTtOk+iQmj
 aheV3XCDLP9DXVGYcS2EZ9EEHA9pIfYilFlSzuoHBs8w6VcD4435PD/rKz8Z25TVOj4guy+sCc4
 wlXKh2ZprnOe+WkWLNKVgB6wN+A3gwAFlU37GZiTbHQ==
X-Received: by 2002:adf:e692:: with SMTP id r18mr18040346wrm.192.1591538233486; 
 Sun, 07 Jun 2020 06:57:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdpLNXIJ5j1LCUCT+yl4S8d3+2bKw0KjrOrbk8tNVbTrugKBbeL7cu5E4wnBuzOcL/qjm20w==
X-Received: by 2002:adf:e692:: with SMTP id r18mr18040336wrm.192.1591538233326; 
 Sun, 07 Jun 2020 06:57:13 -0700 (PDT)
Received: from redhat.com (bzq-82-81-31-23.red.bezeqint.net. [82.81.31.23])
 by smtp.gmail.com with ESMTPSA id o10sm20468647wrj.37.2020.06.07.06.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 06:57:12 -0700 (PDT)
Date: Sun, 7 Jun 2020 09:57:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH RFC 03/13] vhost: batching fetches
Message-ID: <20200607095219-mutt-send-email-mst@kernel.org>
References: <20200602130543.578420-1-mst@redhat.com>
 <20200602130543.578420-4-mst@redhat.com>
 <3323daa2-19ed-02de-0ff7-ab150f949fff@redhat.com>
 <20200604045830-mutt-send-email-mst@kernel.org>
 <6c2e6cc7-27c5-445b-f252-0356ff8a83f3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6c2e6cc7-27c5-445b-f252-0356ff8a83f3@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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

T24gRnJpLCBKdW4gMDUsIDIwMjAgYXQgMTE6NDA6MTdBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzYvNCDkuIvljYg0OjU5LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
Cj4gPiBPbiBXZWQsIEp1biAwMywgMjAyMCBhdCAwMzoyNzozOVBNICswODAwLCBKYXNvbiBXYW5n
IHdyb3RlOgo+ID4gPiBPbiAyMDIwLzYvMiDkuIvljYg5OjA2LCBNaWNoYWVsIFMuIFRzaXJraW4g
d3JvdGU6Cj4gPiA+ID4gV2l0aCB0aGlzIHBhdGNoIGFwcGxpZWQsIG5ldyBhbmQgb2xkIGNvZGUg
cGVyZm9ybSBpZGVudGljYWxseS4KPiA+ID4gPiAKPiA+ID4gPiBMb3RzIG9mIGV4dHJhIG9wdGlt
aXphdGlvbnMgYXJlIG5vdyBwb3NzaWJsZSwgZS5nLgo+ID4gPiA+IHdlIGNhbiBmZXRjaCBtdWx0
aXBsZSBoZWFkcyB3aXRoIGNvcHlfZnJvbS90b191c2VyIG5vdy4KPiA+ID4gPiBXZSBjYW4gZ2V0
IHJpZCBvZiBtYWludGFpbmluZyB0aGUgbG9nIGFycmF5LiAgRXRjIGV0Yy4KPiA+ID4gPiAKPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW48bXN0QHJlZGhhdC5jb20+Cj4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogRXVnZW5pbyBQw6lyZXo8ZXBlcmV6bWFAcmVkaGF0LmNvbT4K
PiA+ID4gPiBMaW5rOmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMDA0MDExODMxMTguODMz
NC00LWVwZXJlem1hQHJlZGhhdC5jb20KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFMu
IFRzaXJraW48bXN0QHJlZGhhdC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gICAgZHJpdmVycy92
aG9zdC90ZXN0LmMgIHwgIDIgKy0KPiA+ID4gPiAgICBkcml2ZXJzL3Zob3N0L3Zob3N0LmMgfCA0
NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCj4gPiA+ID4gICAg
ZHJpdmVycy92aG9zdC92aG9zdC5oIHwgIDUgKysrKy0KPiA+ID4gPiAgICAzIGZpbGVzIGNoYW5n
ZWQsIDQ3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gPiA+ID4gCj4gPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3QvdGVzdC5jIGIvZHJpdmVycy92aG9zdC90ZXN0LmMKPiA+
ID4gPiBpbmRleCA5YTNhMDkwMDVlMDMuLjAyODA2ZDZmODRlZiAxMDA2NDQKPiA+ID4gPiAtLS0g
YS9kcml2ZXJzL3Zob3N0L3Rlc3QuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvdmhvc3QvdGVzdC5j
Cj4gPiA+ID4gQEAgLTExOSw3ICsxMTksNyBAQCBzdGF0aWMgaW50IHZob3N0X3Rlc3Rfb3Blbihz
dHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZikKPiA+ID4gPiAgICAJZGV2ID0gJm4t
PmRldjsKPiA+ID4gPiAgICAJdnFzW1ZIT1NUX1RFU1RfVlFdID0gJm4tPnZxc1tWSE9TVF9URVNU
X1ZRXTsKPiA+ID4gPiAgICAJbi0+dnFzW1ZIT1NUX1RFU1RfVlFdLmhhbmRsZV9raWNrID0gaGFu
ZGxlX3ZxX2tpY2s7Cj4gPiA+ID4gLQl2aG9zdF9kZXZfaW5pdChkZXYsIHZxcywgVkhPU1RfVEVT
VF9WUV9NQVgsIFVJT19NQVhJT1YsCj4gPiA+ID4gKwl2aG9zdF9kZXZfaW5pdChkZXYsIHZxcywg
VkhPU1RfVEVTVF9WUV9NQVgsIFVJT19NQVhJT1YgKyA2NCwKPiA+ID4gPiAgICAJCSAgICAgICBW
SE9TVF9URVNUX1BLVF9XRUlHSFQsIFZIT1NUX1RFU1RfV0VJR0hULCBOVUxMKTsKPiA+ID4gPiAg
ICAJZi0+cHJpdmF0ZV9kYXRhID0gbjsKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9z
dC92aG9zdC5jIGIvZHJpdmVycy92aG9zdC92aG9zdC5jCj4gPiA+ID4gaW5kZXggOGY5YTA3Mjgy
NjI1Li5hY2EyYTViMGQwNzggMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy92aG9zdC92aG9z
dC5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy92aG9zdC92aG9zdC5jCj4gPiA+ID4gQEAgLTI5OSw2
ICsyOTksNyBAQCBzdGF0aWMgdm9pZCB2aG9zdF92cV9yZXNldChzdHJ1Y3Qgdmhvc3RfZGV2ICpk
ZXYsCj4gPiA+ID4gICAgewo+ID4gPiA+ICAgIAl2cS0+bnVtID0gMTsKPiA+ID4gPiAgICAJdnEt
Pm5kZXNjcyA9IDA7Cj4gPiA+ID4gKwl2cS0+Zmlyc3RfZGVzYyA9IDA7Cj4gPiA+ID4gICAgCXZx
LT5kZXNjID0gTlVMTDsKPiA+ID4gPiAgICAJdnEtPmF2YWlsID0gTlVMTDsKPiA+ID4gPiAgICAJ
dnEtPnVzZWQgPSBOVUxMOwo+ID4gPiA+IEBAIC0zNjcsNiArMzY4LDExIEBAIHN0YXRpYyBpbnQg
dmhvc3Rfd29ya2VyKHZvaWQgKmRhdGEpCj4gPiA+ID4gICAgCXJldHVybiAwOwo+ID4gPiA+ICAg
IH0KPiA+ID4gPiArc3RhdGljIGludCB2aG9zdF92cV9udW1fYmF0Y2hfZGVzY3Moc3RydWN0IHZo
b3N0X3ZpcnRxdWV1ZSAqdnEpCj4gPiA+ID4gK3sKPiA+ID4gPiArCXJldHVybiB2cS0+bWF4X2Rl
c2NzIC0gVUlPX01BWElPVjsKPiA+ID4gPiArfQo+ID4gPiAxIGRlc2NyaXB0b3IgZG9lcyBub3Qg
bWVhbiAxIGlvdiwgZS5nIHVzZXJzcGFjZSBtYXkgcGFzcyBzZXZlcmFsIDEgYnl0ZQo+ID4gPiBs
ZW5ndGggbWVtb3J5IHJlZ2lvbnMgZm9yIHVzIHRvIHRyYW5zbGF0ZS4KPiA+ID4gCj4gPiBZZXMg
YnV0IEkgZG9uJ3Qgc2VlIHRoZSByZWxldmFuY2UuIFRoaXMgdGVsbHMgdXMgaG93IG1hbnkgZGVz
Y3JpcHRvcnMgdG8KPiA+IGJhdGNoLCBub3QgaG93IG1hbnkgSU9Wcy4KPiAKPiAKPiBZZXMsIGJ1
dCBxdWVzdGlvbnMgYXJlOgo+IAo+IC0gdGhpcyBpbnRyb2R1Y2UgYW5vdGhlciBvYnN0YWNsZSB0
byBzdXBwb3J0IG1vcmUgdGhhbiAxSyBxdWV1ZSBzaXplCj4gLSBpZiB3ZSBzdXBwb3J0IDFLIHF1
ZXVlIHNpemUsIGRvZXMgaXQgbWVhbiB3ZSBuZWVkIHRvIGNhY2hlIDFLIGRlc2NyaXB0b3JzLAo+
IHdoaWNoIHNlZW1zIGEgbGFyZ2Ugc3RyZXNzIG9uIHRoZSBjYWNoZQo+IAo+IFRoYW5rcwo+IAo+
IAo+ID4gCgpTdGlsbCBkb24ndCB1bmRlcnN0YW5kIHRoZSByZWxldmFuY2UuIFdlIHN1cHBvcnQg
dXAgdG8gMUsgZGVzY3JpcHRvcnMKcGVyIGJ1ZmZlciBqdXN0IGZvciBJT1Ygc2luY2Ugd2UgYWx3
YXlzIGRpZC4gVGhpcyBhZGRzIDY0IG1vcmUKZGVzY3JpcHRvcnMgLSBpcyB0aGF0IGEgYmlnIGRl
YWw/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0
dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vdmlydHVhbGl6YXRpb24=
