Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1894D6E725E
	for <lists.virtualization@lfdr.de>; Wed, 19 Apr 2023 06:42:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D29160E46;
	Wed, 19 Apr 2023 04:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D29160E46
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KKwSYifU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k5JEXnttk9Xc; Wed, 19 Apr 2023 04:42:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7C98860E87;
	Wed, 19 Apr 2023 04:42:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C98860E87
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B93ADC0089;
	Wed, 19 Apr 2023 04:42:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 384CBC002A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Apr 2023 04:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFEA241ED4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Apr 2023 04:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFEA241ED4
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=KKwSYifU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h_ogqidmwUkS
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Apr 2023 04:42:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08D2C41EC7
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08D2C41EC7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Apr 2023 04:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681879321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=roZYYewQxkh9NZH+lDWvAVKdV8rGYEROSckQYRTMBXU=;
 b=KKwSYifUa5ti5PkXdioBbnVNwac2I5uGp0CwbCwH1imnFYrHJznnUxebXcGph8fL6tWWh/
 YAmY4XBJsb9IJPgEg2x/d26doftwq8CnzrhpqaleuiHVq3/UfK/5Y3Yo4/6MYPuu/lot95
 gGKpyTCrQuMZNsIhhNC3EE2T4f4Mgac=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-B3bYd1YGOaK-c3NHeqxeMg-1; Wed, 19 Apr 2023 00:41:57 -0400
X-MC-Unique: B3bYd1YGOaK-c3NHeqxeMg-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-18799a4ca81so926682fac.3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Apr 2023 21:41:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681879317; x=1684471317;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=roZYYewQxkh9NZH+lDWvAVKdV8rGYEROSckQYRTMBXU=;
 b=VQuaIjatowz844wsbbu5UJG9DApB7JypfQYSKoM2lwMP5pYXZZlR32Sw8ps5Tgiuz6
 U51YLt974iWHzj8iSf+/WR5FjYBZ0/3/84M9Imgvy5JRf8R+/C1QwoAAUnBkQRzS+weY
 ch6NJhnrD/Nw/3iWMY93QK3RlttFc0Po8JxP0aDSDUXkjb62gw9UC2oramx1EICD1yDH
 4M5G+e43k4AsLo8+/jZ9hXroUBq90yszyFWNSkakzXlTzuUuZgrc7OtpPs35Hoxfl8Zt
 sfuAOcuN13e0AN2awNrbzFi+10c6WYKM95taS8VvGDST+/pV/pSCceedNdOGc/MlCjIh
 Vhfw==
X-Gm-Message-State: AAQBX9duqQwQPuXruLqrEGI+pLSLfLNcin1xgyEBg8WnnuvwrkdYORRr
 z5+7r+G2p2Q5UCAXfAd00T8pgjhBUqo1JU9Hsab7/aum5jW5463tKQ44rnHI8ynhdylpn9NTe24
 mwIUNToc1FGtlkZfM2dPPJQijnEd1HGV+x1bg1dna2fcc8JA1OYPfHGbg0g==
X-Received: by 2002:a05:6870:e2cd:b0:183:fc80:7354 with SMTP id
 w13-20020a056870e2cd00b00183fc807354mr3076879oad.21.1681879316694; 
 Tue, 18 Apr 2023 21:41:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350atDBo4BHK7Mlp3JJvQxjjQ5XFwRuF1g+wRw5fqLMYgfGShKxeAt+8/sDo+NWF2FaeeOtBrYTXb75HUgHpwf0w=
X-Received: by 2002:a05:6870:e2cd:b0:183:fc80:7354 with SMTP id
 w13-20020a056870e2cd00b00183fc807354mr3076862oad.21.1681879316376; Tue, 18
 Apr 2023 21:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230403162039.18932-1-elic@nvidia.com>
 <20230403162039.18932-2-elic@nvidia.com>
 <3754b094-d3aa-3f9f-f6e9-2add2e44aae9@redhat.com>
 <c12e67e9-2757-b1e3-93ae-f05df3774d03@nvidia.com>
 <CACGkMEu7J5vT_Qq5sHkNY2KGrTVssTYGeXUmWJ-r-foe8oWKWg@mail.gmail.com>
 <9200f3cc-aa57-c1ba-0d45-d6148eaa4533@nvidia.com>
In-Reply-To: <9200f3cc-aa57-c1ba-0d45-d6148eaa4533@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 19 Apr 2023 12:41:45 +0800
Message-ID: <CACGkMEvTKiw9fJt5NtAaox=tUMs_5EeumXQN0+jcKGo3xT1BNQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] vdpa/mlx5: Support interrupt bypassing
To: Eli Cohen <elic@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: parav@mellanox.com, mst@redhat.com,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 Saeed Mahameed <saeedm@nvidia.com>
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

T24gVGh1LCBBcHIgMTMsIDIwMjMgYXQgMTA6MznigK9QTSBFbGkgQ29oZW4gPGVsaWNAbnZpZGlh
LmNvbT4gd3JvdGU6Cj4KPgo+IE9uIDEwLzA0LzIwMjMgNTowMCwgSmFzb24gV2FuZyB3cm90ZToK
PiA+IE9uIFR1ZSwgQXByIDQsIDIwMjMgYXQgMzowNOKAr1BNIEVsaSBDb2hlbiA8ZWxpY0Budmlk
aWEuY29tPiB3cm90ZToKPiA+Pgo+ID4+IE9uIDA0LzA0LzIwMjMgNToyNCwgSmFzb24gV2FuZyB3
cm90ZToKPiA+Pj4g5ZyoIDIwMjMvNC80IDAwOjIwLCBFbGkgQ29oZW4g5YaZ6YGTOgo+ID4+Pj4g
QWRkIHN1cHBvcnQgZm9yIGdlbmVyYXRpb24gb2YgaW50ZXJydXB0cyBmcm9tIHRoZSBkZXZpY2Ug
ZGlyZWN0bHkgdG8gdGhlCj4gPj4+PiBWTSB0byB0aGUgVkNQVSB0aHVzIGF2b2lkaW5nIHRoZSBv
dmVyaGVhZCBvbiB0aGUgaG9zdCBDUFUuCj4gPj4+Pgo+ID4+Pj4gV2hlbiBzdXBwb3J0ZWQsIHRo
ZSBkcml2ZXIgd2lsbCBhdHRlbXB0IHRvIGFsbG9jYXRlIHZlY3RvcnMgZm9yIGVhY2gKPiA+Pj4+
IGRhdGEgdmlydHF1ZXVlLiBJZiBhIHZlY3RvciBmb3IgYSB2aXJ0cXVldWUgY2Fubm90IGJlIHBy
b3ZpZGVkIGl0IHdpbGwKPiA+Pj4+IHVzZSB0aGUgUVAgbW9kZSB3aGVyZSBub3RpZmljYXRpb25z
IGdvIHRocm91Z2ggdGhlIGRyaXZlci4KPiA+Pj4+Cj4gPj4+PiBJbiBhZGRpdGlvbiwgd2UgYWRk
IGEgc2h1dGRvd24gY2FsbGJhY2sgdG8gbWFrZSBzdXJlIGFsbG9jYXRlZAo+ID4+Pj4gaW50ZXJy
dXB0cyBhcmUgcmVsZWFzZWQgaW4gY2FzZSBvZiBzaHV0ZG93biB0byBhbGxvdyBjbGVhbiBzaHV0
ZG93bi4KPiA+Pj4+Cj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBFbGkgQ29oZW4gPGVsaWNAbnZpZGlh
LmNvbT4KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IFNhZWVkIE1haGFtZWVkIDxzYWVlZG1AbnZpZGlh
LmNvbT4KPiA+Pj4+IC0tLQo+ID4+Pj4gICAgZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVfdm5l
dC5jIHwgMTM5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLQo+ID4+Pj4gICAgZHJpdmVy
cy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5oIHwgIDE0ICsrKwo+ID4+Pj4gICAgMiBmaWxlcyBj
aGFuZ2VkLCAxNDQgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiA+Pj4+Cj4gPj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5jCj4gPj4+PiBiL2Ry
aXZlcnMvdmRwYS9tbHg1L25ldC9tbHg1X3ZuZXQuYwo+ID4+Pj4gaW5kZXggNTIwNjQ2YWU3ZmEw
Li4yMTVhNDZjZjhhOTggMTAwNjQ0Cj4gPj4+PiAtLS0gYS9kcml2ZXJzL3ZkcGEvbWx4NS9uZXQv
bWx4NV92bmV0LmMKPiA+Pj4+ICsrKyBiL2RyaXZlcnMvdmRwYS9tbHg1L25ldC9tbHg1X3ZuZXQu
Ywo+ID4+Pj4gQEAgLTgzLDYgKzgzLDcgQEAgc3RydWN0IG1seDVfdnFfcmVzdG9yZV9pbmZvIHsK
PiA+Pj4+ICAgICAgICB1NjQgZHJpdmVyX2FkZHI7Cj4gPj4+PiAgICAgICAgdTE2IGF2YWlsX2lu
ZGV4Owo+ID4+Pj4gICAgICAgIHUxNiB1c2VkX2luZGV4Owo+ID4+Pj4gKyAgICBzdHJ1Y3QgbXNp
X21hcCBtYXA7Cj4gPj4+PiAgICAgICAgYm9vbCByZWFkeTsKPiA+Pj4+ICAgICAgICBib29sIHJl
c3RvcmU7Cj4gPj4+PiAgICB9Owo+ID4+Pj4gQEAgLTExOCw2ICsxMTksNyBAQCBzdHJ1Y3QgbWx4
NV92ZHBhX3ZpcnRxdWV1ZSB7Cj4gPj4+PiAgICAgICAgdTE2IGF2YWlsX2lkeDsKPiA+Pj4+ICAg
ICAgICB1MTYgdXNlZF9pZHg7Cj4gPj4+PiAgICAgICAgaW50IGZ3X3N0YXRlOwo+ID4+Pj4gKyAg
ICBzdHJ1Y3QgbXNpX21hcCBtYXA7Cj4gPj4+Cj4gPj4+IEp1c3Qgc3BvdCB0aGF0IHRoaXMgc3Ry
dWN0dXJlIGlzIGRlZmluZWQgaW4gbWx4NV92bmV0LmMgYnV0IGl0J3MKPiA+Pj4gbm90aGluZyBu
ZXQgc3BlY2lmaWMuIEkgdGhpbmsgaXQncyBiZXR0ZXIgdG8gbW92ZSBpdCB3aXRoIHRoZQo+ID4+
PiBpbnRlcnJ1cHQgYnlwYXNzaW5nIGxvZ2ljIGhlcmUgdG8gY29yZS8gKHdlIGNhbiBkbyBpdCBp
biB0aGUgZnV0dXJlKS4KPiA+PiBSaWdodC4KPiA+Pj4KPiA+Pj4+ICAgICAgICAgIC8qIGtlZXAg
bGFzdCBpbiB0aGUgc3RydWN0ICovCj4gPj4+PiAgICAgICAgc3RydWN0IG1seDVfdnFfcmVzdG9y
ZV9pbmZvIHJpOwo+ID4+Pj4gQEAgLTc5Miw2ICs3OTQsMTMgQEAgc3RhdGljIGJvb2wgY291bnRl
cnNfc3VwcG9ydGVkKGNvbnN0IHN0cnVjdAo+ID4+Pj4gbWx4NV92ZHBhX2RldiAqbXZkZXYpCj4g
Pj4+PiAgICAgICAgICAgICAgIEJJVF9VTEwoTUxYNV9PQkpfVFlQRV9WSVJUSU9fUV9DT1VOVEVS
Uyk7Cj4gPj4+PiAgICB9Cj4gPj4+PiAgICArc3RhdGljIGJvb2wgbXNpeF9tb2RlX3N1cHBvcnRl
ZChzdHJ1Y3QgbWx4NV92ZHBhX2RldiAqbXZkZXYpCj4gPj4+PiArewo+ID4+Pj4gKyAgICByZXR1
cm4gKE1MWDVfQ0FQX0RFVl9WRFBBX0VNVUxBVElPTihtdmRldi0+bWRldiwgZXZlbnRfbW9kZSkg
Jgo+ID4+Pj4gKyAgICAgICAgKDEgPDwgTUxYNV9WSVJUSU9fUV9FVkVOVF9NT0RFX01TSVhfTU9E
RSkgJiYKPiA+Pj4+ICsgICAgICAgIHBjaV9tc2l4X2Nhbl9hbGxvY19keW4obXZkZXYtPm1kZXYt
PnBkZXYpKTsKPiA+Pj4+ICt9Cj4gPj4+PiArCj4gPj4+PiAgICBzdGF0aWMgaW50IGNyZWF0ZV92
aXJ0cXVldWUoc3RydWN0IG1seDVfdmRwYV9uZXQgKm5kZXYsIHN0cnVjdAo+ID4+Pj4gbWx4NV92
ZHBhX3ZpcnRxdWV1ZSAqbXZxKQo+ID4+Pj4gICAgewo+ID4+Pj4gICAgICAgIGludCBpbmxlbiA9
IE1MWDVfU1RfU1pfQllURVMoY3JlYXRlX3ZpcnRpb19uZXRfcV9pbik7Cj4gPj4+PiBAQCAtODI5
LDkgKzgzOCwxNSBAQCBzdGF0aWMgaW50IGNyZWF0ZV92aXJ0cXVldWUoc3RydWN0IG1seDVfdmRw
YV9uZXQKPiA+Pj4+ICpuZGV2LCBzdHJ1Y3QgbWx4NV92ZHBhX3ZpcnRxdWUKPiA+Pj4+ICAgICAg
ICBpZiAodnFfaXNfdHgobXZxLT5pbmRleCkpCj4gPj4+PiAgICAgICAgICAgIE1MWDVfU0VUKHZp
cnRpb19uZXRfcV9vYmplY3QsIG9ial9jb250ZXh0LCB0aXNuX29yX3FwbiwKPiA+Pj4+IG5kZXYt
PnJlcy50aXNuKTsKPiA+Pj4+ICAgIC0gICAgTUxYNV9TRVQodmlydGlvX3EsIHZxX2N0eCwgZXZl
bnRfbW9kZSwKPiA+Pj4+IE1MWDVfVklSVElPX1FfRVZFTlRfTU9ERV9RUF9NT0RFKTsKPiA+Pj4+
ICsgICAgaWYgKG12cS0+bWFwLnZpcnEpIHsKPiA+Pj4+ICsgICAgICAgIE1MWDVfU0VUKHZpcnRp
b19xLCB2cV9jdHgsIGV2ZW50X21vZGUsCj4gPj4+PiBNTFg1X1ZJUlRJT19RX0VWRU5UX01PREVf
TVNJWF9NT0RFKTsKPiA+Pj4+ICsgICAgICAgIE1MWDVfU0VUKHZpcnRpb19xLCB2cV9jdHgsIGV2
ZW50X3Fwbl9vcl9tc2l4LCBtdnEtPm1hcC5pbmRleCk7Cj4gPj4+PiArICAgIH0gZWxzZSB7Cj4g
Pj4+PiArICAgICAgICBNTFg1X1NFVCh2aXJ0aW9fcSwgdnFfY3R4LCBldmVudF9tb2RlLAo+ID4+
Pj4gTUxYNV9WSVJUSU9fUV9FVkVOVF9NT0RFX1FQX01PREUpOwo+ID4+Pj4gKyAgICAgICAgTUxY
NV9TRVQodmlydGlvX3EsIHZxX2N0eCwgZXZlbnRfcXBuX29yX21zaXgsCj4gPj4+PiBtdnEtPmZ3
cXAubXFwLnFwbik7Cj4gPj4+PiArICAgIH0KPiA+Pj4+ICsKPiA+Pj4+ICAgICAgICBNTFg1X1NF
VCh2aXJ0aW9fcSwgdnFfY3R4LCBxdWV1ZV9pbmRleCwgbXZxLT5pbmRleCk7Cj4gPj4+PiAtICAg
IE1MWDVfU0VUKHZpcnRpb19xLCB2cV9jdHgsIGV2ZW50X3Fwbl9vcl9tc2l4LCBtdnEtPmZ3cXAu
bXFwLnFwbik7Cj4gPj4+PiAgICAgICAgTUxYNV9TRVQodmlydGlvX3EsIHZxX2N0eCwgcXVldWVf
c2l6ZSwgbXZxLT5udW1fZW50KTsKPiA+Pj4+ICAgICAgICBNTFg1X1NFVCh2aXJ0aW9fcSwgdnFf
Y3R4LCB2aXJ0aW9fdmVyc2lvbl8xXzAsCj4gPj4+PiAgICAgICAgICAgICAhIShuZGV2LT5tdmRl
di5hY3R1YWxfZmVhdHVyZXMgJgo+ID4+Pj4gQklUX1VMTChWSVJUSU9fRl9WRVJTSU9OXzEpKSk7
Cj4gPj4+PiBAQCAtMTE3NCw2ICsxMTg5LDMyIEBAIHN0YXRpYyB2b2lkIGNvdW50ZXJfc2V0X2Rl
YWxsb2Moc3RydWN0Cj4gPj4+PiBtbHg1X3ZkcGFfbmV0ICpuZGV2LCBzdHJ1Y3QgbWx4NV92ZHBh
X3Zpcgo+ID4+Pj4gICAgICAgICAgICBtbHg1X3ZkcGFfd2FybigmbmRldi0+bXZkZXYsICJkZWFs
bG9jIGNvdW50ZXIgc2V0IDB4JXhcbiIsCj4gPj4+PiBtdnEtPmNvdW50ZXJfc2V0X2lkKTsKPiA+
Pj4+ICAgIH0KPiA+Pj4+ICAgICtzdGF0aWMgdm9pZCBhbGxvY192ZWN0b3Ioc3RydWN0IG1seDVf
dmRwYV9uZXQgKm5kZXYsCj4gPj4+PiArICAgICAgICAgICAgIHN0cnVjdCBtbHg1X3ZkcGFfdmly
dHF1ZXVlICptdnEpCj4gPj4+PiArewo+ID4+Pj4gKyAgICBzdHJ1Y3QgbWx4NV92ZHBhX2lycV9w
b29sICppcnFwID0gJm5kZXYtPmlycXA7Cj4gPj4+PiArICAgIGludCBpOwo+ID4+Pj4gKwo+ID4+
Pj4gKyAgICBmb3IgKGkgPSAwOyBpIDwgaXJxcC0+bnVtX2VudDsgaSsrKSB7Cj4gPj4+PiArICAg
ICAgICBpZiAoIWlycXAtPmVudHJpZXNbaV0udXNlY291bnQpIHsKPiA+Pj4+ICsgICAgICAgICAg
ICBpcnFwLT5lbnRyaWVzW2ldLnVzZWNvdW50Kys7Cj4gPj4+Cj4gPj4+IElmIHdlIGNhbid0IGdl
dCBhIHVzZXJjb3VudCB3aGljaCBpcyBncmVhdGVyIHRoYW4gMSwgaXQgbWlnaHQgYmUKPiA+Pj4g
YmV0dGVyIHRvIHVzZSBib29sZWFuIGluc3RlYWQuCj4gPj4gV2lsbCBmaXguCj4gPj4+Cj4gPj4+
PiArICAgICAgICAgICAgbXZxLT5tYXAgPSBpcnFwLT5lbnRyaWVzW2ldLm1hcDsKPiA+Pj4+ICsg
ICAgICAgICAgICByZXR1cm47Cj4gPj4+PiArICAgICAgICB9Cj4gPj4+PiArICAgIH0KPiA+Pj4+
ICt9Cj4gPj4+PiArCj4gPj4+PiArc3RhdGljIHZvaWQgZGVhbGxvY192ZWN0b3Ioc3RydWN0IG1s
eDVfdmRwYV9uZXQgKm5kZXYsCj4gPj4+PiArICAgICAgICAgICAgICAgc3RydWN0IG1seDVfdmRw
YV92aXJ0cXVldWUgKm12cSkKPiA+Pj4+ICt7Cj4gPj4+PiArICAgIHN0cnVjdCBtbHg1X3ZkcGFf
aXJxX3Bvb2wgKmlycXAgPSAmbmRldi0+aXJxcDsKPiA+Pj4+ICsgICAgaW50IGk7Cj4gPj4+PiAr
Cj4gPj4+PiArICAgIGZvciAoaSA9IDA7IGkgPCBpcnFwLT5udW1fZW50OyBpKyspCj4gPj4+PiAr
ICAgICAgICBpZiAobXZxLT5tYXAudmlycSA9PSBpcnFwLT5lbnRyaWVzW2ldLm1hcC52aXJxKQo+
ID4+Pj4gKyAgICAgICAgICAgIGlycXAtPmVudHJpZXNbaV0udXNlY291bnQtLTsKPiA+Pj4+ICt9
Cj4gPj4+PiArCj4gPj4+PiAgICBzdGF0aWMgaW50IHNldHVwX3ZxKHN0cnVjdCBtbHg1X3ZkcGFf
bmV0ICpuZGV2LCBzdHJ1Y3QKPiA+Pj4+IG1seDVfdmRwYV92aXJ0cXVldWUgKm12cSkKPiA+Pj4+
ICAgIHsKPiA+Pj4+ICAgICAgICB1MTYgaWR4ID0gbXZxLT5pbmRleDsKPiA+Pj4+IEBAIC0xMjAz
LDI3ICsxMjQ0LDMxIEBAIHN0YXRpYyBpbnQgc2V0dXBfdnEoc3RydWN0IG1seDVfdmRwYV9uZXQK
PiA+Pj4+ICpuZGV2LCBzdHJ1Y3QgbWx4NV92ZHBhX3ZpcnRxdWV1ZSAqbXZxKQo+ID4+Pj4gICAg
ICAgICAgZXJyID0gY291bnRlcl9zZXRfYWxsb2MobmRldiwgbXZxKTsKPiA+Pj4+ICAgICAgICBp
ZiAoZXJyKQo+ID4+Pj4gLSAgICAgICAgZ290byBlcnJfY291bnRlcjsKPiA+Pj4+ICsgICAgICAg
IGdvdG8gZXJyX2Nvbm5lY3Q7Cj4gPj4+PiAgICArICAgIGFsbG9jX3ZlY3RvcihuZGV2LCBtdnEp
Owo+ID4+Pj4gICAgICAgIGVyciA9IGNyZWF0ZV92aXJ0cXVldWUobmRldiwgbXZxKTsKPiA+Pj4+
ICAgICAgICBpZiAoZXJyKQo+ID4+Pj4gLSAgICAgICAgZ290byBlcnJfY29ubmVjdDsKPiA+Pj4+
ICsgICAgICAgIGdvdG8gZXJyX3ZxOwo+ID4+Pj4gICAgICAgICAgaWYgKG12cS0+cmVhZHkpIHsK
PiA+Pj4+ICAgICAgICAgICAgZXJyID0gbW9kaWZ5X3ZpcnRxdWV1ZShuZGV2LCBtdnEsCj4gPj4+
PiBNTFg1X1ZJUlRJT19ORVRfUV9PQkpFQ1RfU1RBVEVfUkRZKTsKPiA+Pj4+ICAgICAgICAgICAg
aWYgKGVycikgewo+ID4+Pj4gICAgICAgICAgICAgICAgbWx4NV92ZHBhX3dhcm4oJm5kZXYtPm12
ZGV2LCAiZmFpbGVkIHRvIG1vZGlmeSB0byByZWFkeQo+ID4+Pj4gdnEgaWR4ICVkKCVkKVxuIiwK
PiA+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgaWR4LCBlcnIpOwo+ID4+Pj4gLSAgICAg
ICAgICAgIGdvdG8gZXJyX2Nvbm5lY3Q7Cj4gPj4+PiArICAgICAgICAgICAgZ290byBlcnJfbW9k
aWZ5Owo+ID4+Pj4gICAgICAgICAgICB9Cj4gPj4+PiAgICAgICAgfQo+ID4+Pj4gICAgICAgICAg
bXZxLT5pbml0aWFsaXplZCA9IHRydWU7Cj4gPj4+PiAgICAgICAgcmV0dXJuIDA7Cj4gPj4+PiAg
ICAtZXJyX2Nvbm5lY3Q6Cj4gPj4+PiArZXJyX21vZGlmeToKPiA+Pj4+ICsgICAgZGVzdHJveV92
aXJ0cXVldWUobmRldiwgbXZxKTsKPiA+Pj4+ICtlcnJfdnE6Cj4gPj4+PiArICAgIGRlYWxsb2Nf
dmVjdG9yKG5kZXYsIG12cSk7Cj4gPj4+PiAgICAgICAgY291bnRlcl9zZXRfZGVhbGxvYyhuZGV2
LCBtdnEpOwo+ID4+Pj4gLWVycl9jb3VudGVyOgo+ID4+Pj4gK2Vycl9jb25uZWN0Ogo+ID4+Pj4g
ICAgICAgIHFwX2Rlc3Ryb3kobmRldiwgJm12cS0+dnFxcCk7Cj4gPj4+PiAgICBlcnJfdnFxcDoK
PiA+Pj4+ICAgICAgICBxcF9kZXN0cm95KG5kZXYsICZtdnEtPmZ3cXApOwo+ID4+Pj4gQEAgLTEy
NjcsNiArMTMxMiw3IEBAIHN0YXRpYyB2b2lkIHRlYXJkb3duX3ZxKHN0cnVjdCBtbHg1X3ZkcGFf
bmV0Cj4gPj4+PiAqbmRldiwgc3RydWN0IG1seDVfdmRwYV92aXJ0cXVldWUgKgo+ID4+Pj4gICAg
ICAgICAgICByZXR1cm47Cj4gPj4+PiAgICAgICAgICBzdXNwZW5kX3ZxKG5kZXYsIG12cSk7Cj4g
Pj4+PiArICAgIGRlYWxsb2NfdmVjdG9yKG5kZXYsIG12cSk7Cj4gPj4+PiAgICAgICAgZGVzdHJv
eV92aXJ0cXVldWUobmRldiwgbXZxKTsKPiA+Pj4+ICAgICAgICBjb3VudGVyX3NldF9kZWFsbG9j
KG5kZXYsIG12cSk7Cj4gPj4+PiAgICAgICAgcXBfZGVzdHJveShuZGV2LCAmbXZxLT52cXFwKTsK
PiA+Pj4+IEBAIC0yMzc0LDYgKzI0MjAsNyBAQCBzdGF0aWMgaW50IHNhdmVfY2hhbm5lbF9pbmZv
KHN0cnVjdAo+ID4+Pj4gbWx4NV92ZHBhX25ldCAqbmRldiwgc3RydWN0IG1seDVfdmRwYV92aXJ0
cXUKPiA+Pj4+ICAgICAgICByaS0+ZGVzY19hZGRyID0gbXZxLT5kZXNjX2FkZHI7Cj4gPj4+PiAg
ICAgICAgcmktPmRldmljZV9hZGRyID0gbXZxLT5kZXZpY2VfYWRkcjsKPiA+Pj4+ICAgICAgICBy
aS0+ZHJpdmVyX2FkZHIgPSBtdnEtPmRyaXZlcl9hZGRyOwo+ID4+Pj4gKyAgICByaS0+bWFwID0g
bXZxLT5tYXA7Cj4gPj4+PiAgICAgICAgcmktPnJlc3RvcmUgPSB0cnVlOwo+ID4+Pj4gICAgICAg
IHJldHVybiAwOwo+ID4+Pj4gICAgfQo+ID4+Pj4gQEAgLTI0MTgsNiArMjQ2NSw3IEBAIHN0YXRp
YyB2b2lkIHJlc3RvcmVfY2hhbm5lbHNfaW5mbyhzdHJ1Y3QKPiA+Pj4+IG1seDVfdmRwYV9uZXQg
Km5kZXYpCj4gPj4+PiAgICAgICAgICAgIG12cS0+ZGVzY19hZGRyID0gcmktPmRlc2NfYWRkcjsK
PiA+Pj4+ICAgICAgICAgICAgbXZxLT5kZXZpY2VfYWRkciA9IHJpLT5kZXZpY2VfYWRkcjsKPiA+
Pj4+ICAgICAgICAgICAgbXZxLT5kcml2ZXJfYWRkciA9IHJpLT5kcml2ZXJfYWRkcjsKPiA+Pj4+
ICsgICAgICAgIG12cS0+bWFwID0gcmktPm1hcDsKPiA+Pj4+ICAgICAgICB9Cj4gPj4+PiAgICB9
Cj4gPj4+PiAgICBAQCAtMjY5Myw2ICsyNzQxLDIyIEBAIHN0YXRpYyBzdHJ1Y3QgZGV2aWNlCj4g
Pj4+PiAqbWx4NV9nZXRfdnFfZG1hX2RldihzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYsIHUxNiBp
ZHgpCj4gPj4+PiAgICAgICAgcmV0dXJuIG12ZGV2LT52ZGV2LmRtYV9kZXY7Cj4gPj4+PiAgICB9
Cj4gPj4+PiAgICArc3RhdGljIHZvaWQgZnJlZV9pcnFzKHN0cnVjdCBtbHg1X3ZkcGFfbmV0ICpu
ZGV2KQo+ID4+Pj4gK3sKPiA+Pj4+ICsgICAgc3RydWN0IG1seDVfdmRwYV9pcnFfcG9vbF9lbnRy
eSAqZW50Owo+ID4+Pj4gKyAgICBpbnQgaTsKPiA+Pj4+ICsKPiA+Pj4+ICsgICAgaWYgKCFtc2l4
X21vZGVfc3VwcG9ydGVkKCZuZGV2LT5tdmRldikpCj4gPj4+PiArICAgICAgICByZXR1cm47Cj4g
Pj4+PiArCj4gPj4+PiArICAgIGZvciAoaSA9IG5kZXYtPmlycXAubnVtX2VudCAtIDE7IGkgPj0g
MDsgaS0tKSB7Cj4gPj4+PiArICAgICAgICBlbnQgPSBuZGV2LT5pcnFwLmVudHJpZXMgKyBpOwo+
ID4+Pj4gKyAgICAgICAgbWx4NV9tc2l4X2ZyZWUobmRldi0+bXZkZXYubWRldiwgZW50LT5tYXAp
Owo+ID4+Pj4gKyAgICAgICAgbmRldi0+aXJxcC5udW1fZW50LS07Cj4gPj4+PiArICAgIH0KPiA+
Pj4+ICsgICAga2ZyZWUobmRldi0+aXJxcC5lbnRyaWVzKTsKPiA+Pj4+ICt9Cj4gPj4+PiArCj4g
Pj4+PiAgICBzdGF0aWMgdm9pZCBtbHg1X3ZkcGFfZnJlZShzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZk
ZXYpCj4gPj4+PiAgICB7Cj4gPj4+PiAgICAgICAgc3RydWN0IG1seDVfdmRwYV9kZXYgKm12ZGV2
ID0gdG9fbXZkZXYodmRldik7Cj4gPj4+PiBAQCAtMjcwOCw2ICsyNzcyLDcgQEAgc3RhdGljIHZv
aWQgbWx4NV92ZHBhX2ZyZWUoc3RydWN0IHZkcGFfZGV2aWNlCj4gPj4+PiAqdmRldikKPiA+Pj4+
ICAgICAgICAgICAgbWx4NV9tcGZzX2RlbF9tYWMocGZtZGV2LCBuZGV2LT5jb25maWcubWFjKTsK
PiA+Pj4+ICAgICAgICB9Cj4gPj4+PiAgICAgICAgbWx4NV92ZHBhX2ZyZWVfcmVzb3VyY2VzKCZu
ZGV2LT5tdmRldik7Cj4gPj4+PiArICAgIGZyZWVfaXJxcyhuZGV2KTsKPiA+Pj4+ICAgICAgICBr
ZnJlZShuZGV2LT5ldmVudF9jYnMpOwo+ID4+Pj4gICAgICAgIGtmcmVlKG5kZXYtPnZxcyk7Cj4g
Pj4+PiAgICB9Cj4gPj4+PiBAQCAtMjczNiw5ICsyODAxLDIzIEBAIHN0YXRpYyBzdHJ1Y3QgdmRw
YV9ub3RpZmljYXRpb25fYXJlYQo+ID4+Pj4gbWx4NV9nZXRfdnFfbm90aWZpY2F0aW9uKHN0cnVj
dCB2ZHBhX2RldmljZQo+ID4+Pj4gICAgICAgIHJldHVybiByZXQ7Cj4gPj4+PiAgICB9Cj4gPj4+
PiAgICAtc3RhdGljIGludCBtbHg1X2dldF92cV9pcnEoc3RydWN0IHZkcGFfZGV2aWNlICp2ZHYs
IHUxNiBpZHgpCj4gPj4+PiArc3RhdGljIGludCBtbHg1X2dldF92cV9pcnEoc3RydWN0IHZkcGFf
ZGV2aWNlICp2ZGV2LCB1MTYgaWR4KQo+ID4+Pj4gICAgewo+ID4+Pj4gLSAgICByZXR1cm4gLUVP
UE5PVFNVUFA7Cj4gPj4+PiArICAgIHN0cnVjdCBtbHg1X3ZkcGFfZGV2ICptdmRldiA9IHRvX212
ZGV2KHZkZXYpOwo+ID4+Pj4gKyAgICBzdHJ1Y3QgbWx4NV92ZHBhX25ldCAqbmRldiA9IHRvX21s
eDVfdmRwYV9uZGV2KG12ZGV2KTsKPiA+Pj4+ICsgICAgc3RydWN0IG1seDVfdmRwYV92aXJ0cXVl
dWUgKm12cTsKPiA+Pj4+ICsKPiA+Pj4+ICsgICAgaWYgKCFpc19pbmRleF92YWxpZChtdmRldiwg
aWR4KSkKPiA+Pj4+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4+Pj4gKwo+ID4+Pj4gKyAg
ICBpZiAoaXNfY3RybF92cV9pZHgobXZkZXYsIGlkeCkpCj4gPj4+PiArICAgICAgICByZXR1cm4g
LUVPUE5PVFNVUFA7Cj4gPj4+PiArCj4gPj4+PiArICAgIG12cSA9ICZuZGV2LT52cXNbaWR4XTsK
PiA+Pj4+ICsgICAgaWYgKCFtdnEtPm1hcC52aXJxKQo+ID4+Pj4gKyAgICAgICAgcmV0dXJuIC1F
T1BOT1RTVVBQOwo+ID4+Pj4gKwo+ID4+Pj4gKyAgICByZXR1cm4gbXZxLT5tYXAudmlycTsKPiA+
Pj4+ICAgIH0KPiA+Pj4+ICAgICAgc3RhdGljIHU2NCBtbHg1X3ZkcGFfZ2V0X2RyaXZlcl9mZWF0
dXJlcyhzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYpCj4gPj4+PiBAQCAtMzA5NSw2ICszMTc0LDM1
IEBAIHN0YXRpYyBpbnQgY29uZmlnX2Z1bmNfbXR1KHN0cnVjdAo+ID4+Pj4gbWx4NV9jb3JlX2Rl
diAqbWRldiwgdTE2IG10dSkKPiA+Pj4+ICAgICAgICByZXR1cm4gZXJyOwo+ID4+Pj4gICAgfQo+
ID4+Pj4gICAgK3N0YXRpYyBpcnFyZXR1cm5fdCBpbnRfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpu
aCkKPiA+Pj4+ICt7Cj4gPj4+PiArICAgIHJldHVybiBJUlFfSEFORExFRDsKPiA+Pj4KPiA+Pj4g
SSdtIG5vdCBzdXJlIEkgZ2V0IHRoZSBtZWFuaW5nIG9mIHRoZSBpcnEgaGFuZGxlci4gTm90ZSB0
aGF0IGV2ZW4gaWYKPiA+Pj4gd2Ugc3VwcG9ydCBnZXRfdnFfaXJxKCkgaXQgZG9lcyBub3QgbWVh
bnMgdGhlIHBvc3RlZCBpbnRlcnJ1cHQgY2FuCj4gPj4+IHdvcmsgZm9yIGVhY2ggaW50ZXJydXB0
LiBJdCB3b3JrIG9ubHkgaWYgc2V2ZXJhbCBjb25kaXRpb25zIGFyZSBtZXQKPiA+Pj4gKGZvciBl
eGFtcGxlIHRoZSBWQ1BVIGlzIHJ1bm5pbmcpLgo+ID4+IE5vdCBzdXJlIEkgZ2V0IGl0LiBDYW4g
eW91IGJlIGV4cGxpY2l0IHdoYXQgbmVlZHMgdG8gYmUgZG9uZSB0byBtYWtlCj4gPj4gc3VyZSB0
aGUgaW50ZXJydXB0cyB3aWxsIGdvIHRocm91Z2ggZGlyZWN0bHkgdG8gdGhlIHZDUFU/Cj4gPiBG
aXJzdGx5LCB0aGUgY29kZSBzaG91bGQgd29yayBpbiB0aGUgc2V0dXBzIHdpdGhvdXQgUEksIGUu
ZyBmb3IgVk1YIGl0Cj4gPiBoYXMgYSBjaGVjayB2bXhfY2FuX3VzZV92dGRfcGkoKToKPiA+Cj4g
PiBzdGF0aWMgYm9vbCB2bXhfY2FuX3VzZV92dGRfcGkoc3RydWN0IGt2bSAqa3ZtKQo+ID4gewo+
ID4gICAgICAgICAgcmV0dXJuIGlycWNoaXBfaW5fa2VybmVsKGt2bSkgJiYgZW5hYmxlX2FwaWN2
ICYmCj4gPiAgICAgICAgICAgICAgICAgIGt2bV9hcmNoX2hhc19hc3NpZ25lZF9kZXZpY2Uoa3Zt
KSAmJgo+ID4gICAgICAgICAgICAgICAgICBpcnFfcmVtYXBwaW5nX2NhcChJUlFfUE9TVElOR19D
QVApOwo+ID4gfQo+ID4KPiA+IFdlIGNhbiBzZWUgaXQgbWlnaHQgb25seSB3b3JrIHdoZW4KPiA+
Cj4gPiAtIGlycSBjaGlwIGlzIGVtdWxhdGVkIGluIHRoZSBrZXJuZWwKPiA+IC0gYXBpY3YgaXMg
ZW5hYmxlZAo+ID4gLSBJUlEgcmVtYXBwaW5nIGlzIHN1cHBvcnRlZAo+Cj4KPiBPSywgc28gd2Ug
cHJvYmFibHkgbmVlZCBhIHB1YmxpYyBBUEkgdG8gdGVsbCB5b3UgdGhhdC4gSSBhbSBub3QgYXdh
cmUgb2YKPiBhbnkuIERvIHlvdSB0aGluayB3ZSBzaG91bGQgaW50cm9kdWNlIG9uZT8KCldlIGRv
bid0IG5lZWQgYW4gQVBJIHRvIGRvIHRoYXQsIHdlIGNhbiBzaW1wbHkgZmFsbGJhY2sgdG8gdGhl
IHNsb3cKcGF0Y2ggd2hpY2ggaXMgdHJpZ2dlcmluZyB0aGUgY2FsbGJhY2sgaW4gdGhlIGludGVy
cnVwdCBoYW5kbGVyLiBUaGVuCmV2ZXJ5dGhpbmcgaXMgZmluZS4KCj4KPiBCVFcsIEkgZGlkbid0
IHNlZSBpbnRlbCBpZmN2ZiBtYWtpbmcgdGhvc2UgY2hlY2tzLiBEb2VzIGl0IG1lYW4gdGhlCj4g
ZHJpdmVyIGlzIGJyb2tlbiBvciBpcyB0aGVyZSBhbnl0aGluZyBJIGFtIG1pc3NpbmcuCj4KPiA+
Cj4gPiBBbmQgd2hhdCdzIG1vcmUgZXZlbiBpZiB3ZSBoYWQgYWxsIG9mIHRob3NlLCBpdCBuZWVk
cyB0byBzYXRpc2Z5IGV4dHJhCj4gPiByZXF1aXJlbWVudHMgbGlrZSB2aXJxIGFmZmluaXR5IGJ1
dCB0aGUgdmlycSBhZmZpbml0eSBpcyB1bmRlciB0aGUKPiA+IGNvbnRyb2wgb2YgdGhlIGd1ZXN0
LCBzbyB3ZSBjYW4ndCBndWFyYW50ZWUgdGhhdCB0aGUgcG9zdCBpbnRlcnJ1cHQKPiA+IGNhbiB3
b3JrIGZvciBlYWNoIHRpbWUuIFNlZSB0aGUgY29tbWVudHMgaW4gdm14X3BpX3VwZGF0ZV9pcnRl
KCk6Cj4gPgo+ID4gICAgICAgICAgICAgICAgICAvKgo+ID4gICAgICAgICAgICAgICAgICAgKiBW
VC1kIFBJIGNhbm5vdCBzdXBwb3J0IHBvc3RpbmcgbXVsdGljYXN0L2Jyb2FkY2FzdAo+ID4gICAg
ICAgICAgICAgICAgICAgKiBpbnRlcnJ1cHRzIHRvIGEgdkNQVSwgd2Ugc3RpbGwgdXNlIGludGVy
cnVwdCByZW1hcHBpbmcKPiA+ICAgICAgICAgICAgICAgICAgICogZm9yIHRoZXNlIGtpbmQgb2Yg
aW50ZXJydXB0cy4KPiA+ICAgICAgICAgICAgICAgICAgICoKPiA+ICAgICAgICAgICAgICAgICAg
ICogRm9yIGxvd2VzdC1wcmlvcml0eSBpbnRlcnJ1cHRzLCB3ZSBvbmx5IHN1cHBvcnQKPiA+ICAg
ICAgICAgICAgICAgICAgICogdGhvc2Ugd2l0aCBzaW5nbGUgQ1BVIGFzIHRoZSBkZXN0aW5hdGlv
biwgZS5nLiB1c2VyCj4gPiAgICAgICAgICAgICAgICAgICAqIGNvbmZpZ3VyZXMgdGhlIGludGVy
cnVwdHMgdmlhIC9wcm9jL2lycSBvciB1c2VzCj4gPiAgICAgICAgICAgICAgICAgICAqIGlycWJh
bGFuY2UgdG8gbWFrZSB0aGUgaW50ZXJydXB0cyBzaW5nbGUtQ1BVLgo+ID4gICAgICAgICAgICAg
ICAgICAgKgo+ID4gICAgICAgICAgICAgICAgICAgKiBXZSB3aWxsIHN1cHBvcnQgZnVsbCBsb3dl
c3QtcHJpb3JpdHkgaW50ZXJydXB0IGxhdGVyLgo+ID4gICAgICAgICAgICAgICAgICAgKgo+ID4g
ICAgICAgICAgICAgICAgICAgKiBJbiBhZGRpdGlvbiwgd2UgY2FuIG9ubHkgaW5qZWN0IGdlbmVy
aWMgaW50ZXJydXB0cyB1c2luZwo+ID4gICAgICAgICAgICAgICAgICAgKiB0aGUgUEkgbWVjaGFu
aXNtLCByZWZ1c2UgdG8gcm91dGUgb3RoZXJzIHRocm91Z2ggaXQuCj4gPiAgICAgICAgICAgICAg
ICAgICAqLwo+ID4KPiA+IFNvIEkgdGhpbmsgd2hhdCBJIGRvbid0IHVuZGVyc3RhbmQgaXMgaG93
IHRoZSBjb2RlIHdvcmtzIGlmIFBJIGlzIG5vdCBzdXBwb3J0ZWQ/Cj4KPiBTbyBpdCBtZWFucyB0
aGF0IG9uIHRoZSBndWVzdCB3ZSBuZWVkIHRvIG1ha2Ugc3VyZSB0aGUgYWZmaW5pdHkgb2YgZWFj
aAo+IFZRIGludGVycnVwdHMgaXMgYWZmaWxpYXRlZCB0byBhIHNpbmdsZSBDUFUgKGVnLiBvbmUg
Yml0IG9ubHkgc2V0KS4KPgo+IEJUVywgb24gbXkgc3lzdGVtIHRoZSBtYXNrIGlzIDB4ZmYgYW5k
IEkgZG9uJ3QgaGF2ZSBhbnkgaXNzdWUgd2l0aAo+IHBvc3RlZCBpbnRlcnJ1cHRzLgoKU3VjaCBh
ZmZpbml0eSBpcyBkZXRlcm1pbmVkIGJ5IHRoZSBndWVzdCBkcml2ZXIgKGUuZyBmb3IgTGludXgs
IHVzZXJzCmNvdWxkIHR3ZWFrIGl0IHZpYSBwcm9jZnMpLiBTbyB3ZSBjYW4ndCBoYXZlIHN1Y2gg
YW4gYXNzdW1wdGlvbi4KClRoYW5rcwoKPgo+ID4KPiA+IFRoYW5rcwo+ID4KPiA+Pj4gU28gaWYg
dGhpcyBpcyB0aGUgZmFsbGJhY2sgaXJxIGhhbmRsZXIgd2hlbiB3ZSBjYW4gZG8gcG9zdCBpbnRl
cnJ1cHQsCj4gPj4+IHNob3VsZCB3ZSB0cmlnZ2VyIHRoZSB2aXJ0cXVldWUgY2FsbGJhY2sgaGVy
ZT8KPiA+PiBJdCdzIG5vdCBhIGZhbGxiYWNrLiBJIHNob3VsZCByZW1vdmUgaXQgY29tcGxldGVs
eS4KPiA+Pgo+ID4+Pgo+ID4+Pj4gK30KPiA+Pj4+ICsKPiA+Pj4+ICtzdGF0aWMgdm9pZCBhbGxv
Y2F0ZV9pcnFzKHN0cnVjdCBtbHg1X3ZkcGFfbmV0ICpuZGV2KQo+ID4+Pj4gK3sKPiA+Pj4+ICsg
ICAgc3RydWN0IG1seDVfdmRwYV9pcnFfcG9vbF9lbnRyeSAqZW50Owo+ID4+Pj4gKyAgICBpbnQg
aTsKPiA+Pj4+ICsKPiA+Pj4+ICsgICAgaWYgKCFtc2l4X21vZGVfc3VwcG9ydGVkKCZuZGV2LT5t
dmRldikpCj4gPj4+PiArICAgICAgICByZXR1cm47Cj4gPj4+PiArCj4gPj4+PiArICAgIG5kZXYt
PmlycXAuZW50cmllcyA9IGtjYWxsb2MobmRldi0+bXZkZXYubWF4X3ZxcywKPiA+Pj4+IHNpemVv
ZigqbmRldi0+aXJxcC5lbnRyaWVzKSwgR0ZQX0tFUk5FTCk7Cj4gPj4+PiArICAgIGlmICghbmRl
di0+aXJxcC5lbnRyaWVzKQo+ID4+Pj4gKyAgICAgICAgcmV0dXJuOwo+ID4+Pj4gKwo+ID4+Pj4g
KyAgICBmb3IgKGkgPSAwOyBpIDwgbmRldi0+bXZkZXYubWF4X3ZxczsgaSsrKSB7Cj4gPj4+PiAr
ICAgICAgICBlbnQgPSBuZGV2LT5pcnFwLmVudHJpZXMgKyBpOwo+ID4+Pj4gKyAgICAgICAgc25w
cmludGYoZW50LT5uYW1lLCBNTFg1X1ZEUEFfSVJRX05BTUVfTEVOLCAiJXMtdnEtJWQiLAo+ID4+
Pj4gKyAgICAgICAgICAgICBkZXZfbmFtZSgmbmRldi0+bXZkZXYudmRldi5kZXYpLCBpKTsKPiA+
Pj4+ICsgICAgICAgIGVudC0+bWFwID0gbWx4NV9tc2l4X2FsbG9jKG5kZXYtPm12ZGV2Lm1kZXYs
IGludF9oYW5kbGVyLAo+ID4+Pj4gTlVMTCwgZW50LT5uYW1lKTsKPiA+Pj4+ICsgICAgICAgIGlm
ICghZW50LT5tYXAudmlycSkKPiA+Pj4+ICsgICAgICAgICAgICByZXR1cm47Cj4gPj4+PiArCj4g
Pj4+PiArICAgICAgICBuZGV2LT5pcnFwLm51bV9lbnQrKzsKPiA+Pj4+ICsgICAgfQo+ID4+Pj4g
K30KPiA+Pj4+ICsKPiA+Pj4+ICAgIHN0YXRpYyBpbnQgbWx4NV92ZHBhX2Rldl9hZGQoc3RydWN0
IHZkcGFfbWdtdF9kZXYgKnZfbWRldiwgY29uc3QKPiA+Pj4+IGNoYXIgKm5hbWUsCj4gPj4+PiAg
ICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCB2ZHBhX2Rldl9zZXRfY29uZmlnICphZGRf
Y29uZmlnKQo+ID4+Pj4gICAgewo+ID4+Pj4gQEAgLTMxNzEsNiArMzI3OSw3IEBAIHN0YXRpYyBp
bnQgbWx4NV92ZHBhX2Rldl9hZGQoc3RydWN0Cj4gPj4+PiB2ZHBhX21nbXRfZGV2ICp2X21kZXYs
IGNvbnN0IGNoYXIgKm5hbWUsCj4gPj4+PiAgICAgICAgfQo+ID4+Pj4gICAgICAgICAgaW5pdF9t
dnFzKG5kZXYpOwo+ID4+Pj4gKyAgICBhbGxvY2F0ZV9pcnFzKG5kZXYpOwo+ID4+Pj4gICAgICAg
IGluaXRfcndzZW0oJm5kZXYtPnJlc2xvY2spOwo+ID4+Pj4gICAgICAgIGNvbmZpZyA9ICZuZGV2
LT5jb25maWc7Cj4gPj4+PiAgICBAQCAtMzM1OCw2ICszNDY3LDE3IEBAIHN0YXRpYyB2b2lkIG1s
eDV2X3JlbW92ZShzdHJ1Y3QKPiA+Pj4+IGF1eGlsaWFyeV9kZXZpY2UgKmFkZXYpCj4gPj4+PiAg
ICAgICAga2ZyZWUobWd0ZGV2KTsKPiA+Pj4+ICAgIH0KPiA+Pj4+ICAgICtzdGF0aWMgdm9pZCBt
bHg1dl9zaHV0ZG93bihzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZSAqYXV4ZGV2KQo+ID4+Pj4gK3sK
PiA+Pj4+ICsgICAgc3RydWN0IG1seDVfdmRwYV9tZ210ZGV2ICptZ3RkZXY7Cj4gPj4+PiArICAg
IHN0cnVjdCBtbHg1X3ZkcGFfbmV0ICpuZGV2Owo+ID4+Pj4gKwo+ID4+Pj4gKyAgICBtZ3RkZXYg
PSBhdXhpbGlhcnlfZ2V0X2RydmRhdGEoYXV4ZGV2KTsKPiA+Pj4+ICsgICAgbmRldiA9IG1ndGRl
di0+bmRldjsKPiA+Pj4+ICsKPiA+Pj4+ICsgICAgZnJlZV9pcnFzKG5kZXYpOwo+ID4+Pj4gK30K
PiA+Pj4+ICsKPiA+Pj4+ICAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZV9p
ZCBtbHg1dl9pZF90YWJsZVtdID0gewo+ID4+Pj4gICAgICAgIHsgLm5hbWUgPSBNTFg1X0FERVZf
TkFNRSAiLnZuZXQiLCB9LAo+ID4+Pj4gICAgICAgIHt9LAo+ID4+Pj4gQEAgLTMzNjksNiArMzQ4
OSw3IEBAIHN0YXRpYyBzdHJ1Y3QgYXV4aWxpYXJ5X2RyaXZlciBtbHg1dl9kcml2ZXIgPSB7Cj4g
Pj4+PiAgICAgICAgLm5hbWUgPSAidm5ldCIsCj4gPj4+PiAgICAgICAgLnByb2JlID0gbWx4NXZf
cHJvYmUsCj4gPj4+PiAgICAgICAgLnJlbW92ZSA9IG1seDV2X3JlbW92ZSwKPiA+Pj4+ICsgICAg
LnNodXRkb3duID0gbWx4NXZfc2h1dGRvd24sCj4gPj4+Cj4gPj4+IFNvIHdlIGFsbG9jYXRlIHRo
ZSBpcnEgZHVyaW5nIGRldl9hZGQsIGl0IHNlZW1zIGNsZWFuZXIgaWYgd2UgZG8gdGhhdAo+ID4+
PiBpbiB0aGUgZGV2X2RlbC4KPiA+PiBOb3Qgc3VyZSB3aGF0IHlvdSBtZWFuIGhlcmUuIFlvdSdy
ZSBzYXlpbmcgSSBzaG91bGQgbm90IGNhbGwgZnJlZV9pcnFzKCkKPiA+PiBpbiBtbHg1dl9zaHV0
ZG93bigpCj4gPj4+IE5vdGUgdGhhdCBtbHg1dl9yZW1vdmUgd2lsbCBjYWxsIHZkcGFfbWdtdGRl
dl91bnJlZ2lzdGVyKCkgd2hpY2ggd2lsbAo+ID4+PiBjYWxsIGRldl9kZWwuCj4gPj4+Cj4gPj4+
IFRoYW5rcwo+ID4+Pgo+ID4+Pgo+ID4+Pj4gICAgICAgIC5pZF90YWJsZSA9IG1seDV2X2lkX3Rh
YmxlLAo+ID4+Pj4gICAgfTsKPiA+Pj4+ICAgIGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZkcGEvbWx4
NS9uZXQvbWx4NV92bmV0LmgKPiA+Pj4+IGIvZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVfdm5l
dC5oCj4gPj4+PiBpbmRleCBjOTBhODllMWRlNGQuLmU1MDYzYjMxMGQzYyAxMDA2NDQKPiA+Pj4+
IC0tLSBhL2RyaXZlcnMvdmRwYS9tbHg1L25ldC9tbHg1X3ZuZXQuaAo+ID4+Pj4gKysrIGIvZHJp
dmVycy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5oCj4gPj4+PiBAQCAtMjYsNiArMjYsMTkgQEAg
c3RhdGljIGlubGluZSB1MTYga2V5MnZpZCh1NjQga2V5KQo+ID4+Pj4gICAgICAgIHJldHVybiAo
dTE2KShrZXkgPj4gNDgpICYgMHhmZmY7Cj4gPj4+PiAgICB9Cj4gPj4+PiAgICArI2RlZmluZSBN
TFg1X1ZEUEFfSVJRX05BTUVfTEVOIDMyCj4gPj4+PiArCj4gPj4+PiArc3RydWN0IG1seDVfdmRw
YV9pcnFfcG9vbF9lbnRyeSB7Cj4gPj4+PiArICAgIHN0cnVjdCBtc2lfbWFwIG1hcDsKPiA+Pj4+
ICsgICAgaW50IHVzZWNvdW50Owo+ID4+Pj4gKyAgICBjaGFyIG5hbWVbTUxYNV9WRFBBX0lSUV9O
QU1FX0xFTl07Cj4gPj4+PiArfTsKPiA+Pj4+ICsKPiA+Pj4+ICtzdHJ1Y3QgbWx4NV92ZHBhX2ly
cV9wb29sIHsKPiA+Pj4+ICsgICAgaW50IG51bV9lbnQ7Cj4gPj4+PiArICAgIHN0cnVjdCBtbHg1
X3ZkcGFfaXJxX3Bvb2xfZW50cnkgKmVudHJpZXM7Cj4gPj4+PiArfTsKPiA+Pj4+ICsKPiA+Pj4+
ICAgIHN0cnVjdCBtbHg1X3ZkcGFfbmV0IHsKPiA+Pj4+ICAgICAgICBzdHJ1Y3QgbWx4NV92ZHBh
X2RldiBtdmRldjsKPiA+Pj4+ICAgICAgICBzdHJ1Y3QgbWx4NV92ZHBhX25ldF9yZXNvdXJjZXMg
cmVzOwo+ID4+Pj4gQEAgLTQ5LDYgKzYyLDcgQEAgc3RydWN0IG1seDVfdmRwYV9uZXQgewo+ID4+
Pj4gICAgICAgIHN0cnVjdCB2ZHBhX2NhbGxiYWNrIGNvbmZpZ19jYjsKPiA+Pj4+ICAgICAgICBz
dHJ1Y3QgbWx4NV92ZHBhX3dxX2VudCBjdnFfZW50Owo+ID4+Pj4gICAgICAgIHN0cnVjdCBobGlz
dF9oZWFkIG1hY3ZsYW5faGFzaFtNTFg1Vl9NQUNWTEFOX1NJWkVdOwo+ID4+Pj4gKyAgICBzdHJ1
Y3QgbWx4NV92ZHBhX2lycV9wb29sIGlycXA7Cj4gPj4+PiAgICAgICAgc3RydWN0IGRlbnRyeSAq
ZGVidWdmczsKPiA+Pj4+ICAgIH07Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
