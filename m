Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F36B434336
	for <lists.virtualization@lfdr.de>; Wed, 20 Oct 2021 04:01:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1AA383641;
	Wed, 20 Oct 2021 02:01:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HTMC6xx0lesr; Wed, 20 Oct 2021 02:01:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6937B836F0;
	Wed, 20 Oct 2021 02:01:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09204C0022;
	Wed, 20 Oct 2021 02:01:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F32E4C000D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 02:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF5A060720
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 02:01:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IBHeqILbY5dM
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 02:01:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D42DE605AB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 02:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634695277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X1GC11yL6MuwZSP/ZQ7reFvX80h4HWr/oOm7A4CY2Qc=;
 b=hfWh/QsvHEPipidWvRCBfZluk1Vy8Y1+6HUfn/XtKXdqUOcMO0zuffJltX53fqJctHjfbI
 aVS9Avm7ochHBfvukSOga1731lz2B5VXcPf5klecuaRN+80Xhgz/kbesFmP/OJ4EHGmsOu
 tNgmS4SBVHLHvZ32qtvuqly3Wu/oXBE=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-f5dxPcuzMEu-iZEicyqFvw-1; Tue, 19 Oct 2021 22:01:16 -0400
X-MC-Unique: f5dxPcuzMEu-iZEicyqFvw-1
Received: by mail-lf1-f72.google.com with SMTP id
 x17-20020a0565123f9100b003ff593b7c65so456721lfa.12
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Oct 2021 19:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X1GC11yL6MuwZSP/ZQ7reFvX80h4HWr/oOm7A4CY2Qc=;
 b=2EnNgllqaHLju9cX3yANYrlsOmV89FUcXZexsEyphgm8/muLdzBGpIiMLDrGef5py6
 FL7+VFxusYop6dgI2zJpAHfm1PHtUPkckzBjwGdV4QIl09kczwwDygQSmyt88aTpZGBr
 1M10lYXdETOxW9d7I2eg3piMcuc++Mysur/tNmJolM4aNJccm4fbolWuD7gCZ1t6EEc/
 xs1XWGoJPXQGgW1E+VowjPlSvODuD59niQMI7dYh9cRs4jm2t3IoLlZVyINDnpFH3FZG
 7QKAK9xWSEIy2QbvxFhHwmrlJjGUmtunAR4oVy9vU8rXbgSPl2bHMCpKT108e9O+MKAQ
 hLhg==
X-Gm-Message-State: AOAM5318VgR/NN4HCr2fVN5fJiQZ0i7tJb5CHshvk+kKT5kQcpJrH4my
 TolR/PUuxq5aTNZLTdyFW9MZ5tuYW39sn1DhbmfFoEwyLNaANhPqWlnbN9s37G4MUrKBGMHf0Uc
 L+AZ7r9IPKgSO/8SdCn27pmN3Aan0XadGEn4H2TslR1CHIsX+k8+iaxu75Q==
X-Received: by 2002:a05:6512:128a:: with SMTP id
 u10mr9644288lfs.84.1634695274552; 
 Tue, 19 Oct 2021 19:01:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGTPWl2zk+ZZgzQ8IheHmFDNopa7S1gX0FfGYj1aBUc1VlnTSM8GHcI+QJGZFwjX6AdRebgh47YC1xyMxtBJQ=
X-Received: by 2002:a05:6512:128a:: with SMTP id
 u10mr9644267lfs.84.1634695274317; 
 Tue, 19 Oct 2021 19:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-12-eperezma@redhat.com>
 <ab9a7771-5f9b-6413-3e38-bd3dc7373256@redhat.com>
 <CAJaqyWfm734HrwTJK71hUQNYVkyDaR8OiqtGro_AX9i_pXfmBQ@mail.gmail.com>
 <78843cbf-0096-816b-da74-5406fdcc3783@redhat.com>
 <CAJaqyWcO9oaGsRe-oMNbmHx7G4Mw0vZfc+7WYQ23+SteoFVn4Q@mail.gmail.com>
In-Reply-To: <CAJaqyWcO9oaGsRe-oMNbmHx7G4Mw0vZfc+7WYQ23+SteoFVn4Q@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 20 Oct 2021 10:01:03 +0800
Message-ID: <CACGkMEtPAR6qwMN5++Q+e5aJGtzMgzo59_+Jf7=Ra=rtdLYS8g@mail.gmail.com>
Subject: Re: [RFC PATCH v4 11/20] vhost: Route host->guest notification
 through shadow virtqueue
To: Eugenio Perez Martin <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Parav Pandit <parav@mellanox.com>, Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>
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

T24gVHVlLCBPY3QgMTksIDIwMjEgYXQgNDo0MCBQTSBFdWdlbmlvIFBlcmV6IE1hcnRpbgo8ZXBl
cmV6bWFAcmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIE9jdCAxNSwgMjAyMSBhdCA2OjQy
IEFNIEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4KPiA+Cj4gPiDl
nKggMjAyMS8xMC8xNSDkuIrljYgxMjozOSwgRXVnZW5pbyBQZXJleiBNYXJ0aW4g5YaZ6YGTOgo+
ID4gPiBPbiBXZWQsIE9jdCAxMywgMjAyMSBhdCA1OjQ3IEFNIEphc29uIFdhbmcgPGphc293YW5n
QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gPj4KPiA+ID4+IOWcqCAyMDIxLzEwLzEg5LiL5Y2IMzow
NSwgRXVnZW5pbyBQw6lyZXog5YaZ6YGTOgo+ID4gPj4+IFRoaXMgd2lsbCBtYWtlIHFlbXUgYXdh
cmUgb2YgdGhlIGRldmljZSB1c2VkIGJ1ZmZlcnMsIGFsbG93aW5nIGl0IHRvCj4gPiA+Pj4gd3Jp
dGUgdGhlIGd1ZXN0IG1lbW9yeSB3aXRoIGl0cyBjb250ZW50cyBpZiBuZWVkZWQuCj4gPiA+Pj4K
PiA+ID4+PiBTaW5jZSB0aGUgdXNlIG9mIHZob3N0X3ZpcnRxdWV1ZV9zdGFydCBjYW4gdW5tYXNr
cyBhbmQgZGlzY2FyZCBjYWxsCj4gPiA+Pj4gZXZlbnRzLCB2aG9zdF92aXJ0cXVldWVfc3RhcnQg
c2hvdWxkIGJlIG1vZGlmaWVkIGluIG9uZSBvZiB0aGVzZSB3YXlzOgo+ID4gPj4+ICogU3BsaXQg
aW4gdHdvOiBPbmUgb2YgdGhlbSB1c2VzIGFsbCBsb2dpYyB0byBzdGFydCBhIHF1ZXVlIHdpdGgg
bm8KPiA+ID4+PiAgICAgc2lkZSBlZmZlY3RzIGZvciB0aGUgZ3Vlc3QsIGFuZCBhbm90aGVyIG9u
ZSB0aGEgYWN0dWFsbHkgYXNzdW1lcyB0aGF0Cj4gPiA+Pj4gICAgIHRoZSBndWVzdCBoYXMganVz
dCBzdGFydGVkIHRoZSBkZXZpY2UuIFZkcGEgc2hvdWxkIHVzZSBqdXN0IHRoZQo+ID4gPj4+ICAg
ICBmb3JtZXIuCj4gPiA+Pj4gKiBBY3R1YWxseSBzdG9yZSBhbmQgY2hlY2sgaWYgdGhlIGd1ZXN0
IG5vdGlmaWVyIGlzIG1hc2tlZCwgYW5kIGRvIGl0Cj4gPiA+Pj4gICAgIGNvbmRpdGlvbmFsbHku
Cj4gPiA+Pj4gKiBMZWZ0IGFzIGl0IGlzLCBhbmQgZHVwbGljYXRlIGFsbCB0aGUgbG9naWMgaW4g
dmhvc3QtdmRwYS4KPiA+ID4+Pgo+ID4gPj4+IFNpZ25lZC1vZmYtYnk6IEV1Z2VuaW8gUMOpcmV6
IDxlcGVyZXptYUByZWRoYXQuY29tPgo+ID4gPj4+IC0tLQo+ID4gPj4+ICAgIGh3L3ZpcnRpby92
aG9zdC1zaGFkb3ctdmlydHF1ZXVlLmMgfCAxOSArKysrKysrKysrKysrKysKPiA+ID4+PiAgICBo
dy92aXJ0aW8vdmhvc3QtdmRwYS5jICAgICAgICAgICAgIHwgMzggKysrKysrKysrKysrKysrKysr
KysrKysrKysrKystCj4gPiA+Pj4gICAgMiBmaWxlcyBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4gPiA+Pj4KPiA+ID4+PiBkaWZmIC0tZ2l0IGEvaHcvdmlydGlvL3Zo
b3N0LXNoYWRvdy12aXJ0cXVldWUuYyBiL2h3L3ZpcnRpby92aG9zdC1zaGFkb3ctdmlydHF1ZXVl
LmMKPiA+ID4+PiBpbmRleCAyMWRjOTlhYjVkLi4zZmUxMjljZjYzIDEwMDY0NAo+ID4gPj4+IC0t
LSBhL2h3L3ZpcnRpby92aG9zdC1zaGFkb3ctdmlydHF1ZXVlLmMKPiA+ID4+PiArKysgYi9ody92
aXJ0aW8vdmhvc3Qtc2hhZG93LXZpcnRxdWV1ZS5jCj4gPiA+Pj4gQEAgLTUzLDYgKzUzLDIyIEBA
IHN0YXRpYyB2b2lkIHZob3N0X2hhbmRsZV9ndWVzdF9raWNrKEV2ZW50Tm90aWZpZXIgKm4pCj4g
PiA+Pj4gICAgICAgIGV2ZW50X25vdGlmaWVyX3NldCgmc3ZxLT5raWNrX25vdGlmaWVyKTsKPiA+
ID4+PiAgICB9Cj4gPiA+Pj4KPiA+ID4+PiArLyogRm9yd2FyZCB2aG9zdCBub3RpZmljYXRpb25z
ICovCj4gPiA+Pj4gK3N0YXRpYyB2b2lkIHZob3N0X3N2cV9oYW5kbGVfY2FsbF9ub190ZXN0KEV2
ZW50Tm90aWZpZXIgKm4pCj4gPiA+Pj4gK3sKPiA+ID4+PiArICAgIFZob3N0U2hhZG93VmlydHF1
ZXVlICpzdnEgPSBjb250YWluZXJfb2YobiwgVmhvc3RTaGFkb3dWaXJ0cXVldWUsCj4gPiA+Pj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNhbGxfbm90aWZp
ZXIpOwo+ID4gPj4+ICsKPiA+ID4+PiArICAgIGV2ZW50X25vdGlmaWVyX3NldCgmc3ZxLT5ndWVz
dF9jYWxsX25vdGlmaWVyKTsKPiA+ID4+PiArfQo+ID4gPj4+ICsKPiA+ID4+PiArc3RhdGljIHZv
aWQgdmhvc3Rfc3ZxX2hhbmRsZV9jYWxsKEV2ZW50Tm90aWZpZXIgKm4pCj4gPiA+Pj4gK3sKPiA+
ID4+PiArICAgIGlmIChsaWtlbHkoZXZlbnRfbm90aWZpZXJfdGVzdF9hbmRfY2xlYXIobikpKSB7
Cj4gPiA+Pj4gKyAgICAgICAgdmhvc3Rfc3ZxX2hhbmRsZV9jYWxsX25vX3Rlc3Qobik7Cj4gPiA+
Pj4gKyAgICB9Cj4gPiA+Pj4gK30KPiA+ID4+PiArCj4gPiA+Pj4gICAgLyoKPiA+ID4+PiAgICAg
KiBPYnRhaW4gdGhlIFNWUSBjYWxsIG5vdGlmaWVyLCB3aGVyZSB2aG9zdCBkZXZpY2Ugbm90aWZp
ZXMgU1ZRIHRoYXQgdGhlcmUKPiA+ID4+PiAgICAgKiBleGlzdHMgcGVuZGluZyB1c2VkIGJ1ZmZl
cnMuCj4gPiA+Pj4gQEAgLTE4MCw2ICsxOTYsOCBAQCBWaG9zdFNoYWRvd1ZpcnRxdWV1ZSAqdmhv
c3Rfc3ZxX25ldyhzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsIGludCBpZHgpCj4gPiA+Pj4gICAgICAg
IH0KPiA+ID4+Pgo+ID4gPj4+ICAgICAgICBzdnEtPnZxID0gdmlydGlvX2dldF9xdWV1ZShkZXYt
PnZkZXYsIHZxX2lkeCk7Cj4gPiA+Pj4gKyAgICBldmVudF9ub3RpZmllcl9zZXRfaGFuZGxlcigm
c3ZxLT5jYWxsX25vdGlmaWVyLAo+ID4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdmhvc3Rfc3ZxX2hhbmRsZV9jYWxsKTsKPiA+ID4+PiAgICAgICAgcmV0dXJuIGdfc3RlYWxf
cG9pbnRlcigmc3ZxKTsKPiA+ID4+Pgo+ID4gPj4+ICAgIGVycl9pbml0X2NhbGxfbm90aWZpZXI6
Cj4gPiA+Pj4gQEAgLTE5NSw2ICsyMTMsNyBAQCBlcnJfaW5pdF9raWNrX25vdGlmaWVyOgo+ID4g
Pj4+ICAgIHZvaWQgdmhvc3Rfc3ZxX2ZyZWUoVmhvc3RTaGFkb3dWaXJ0cXVldWUgKnZxKQo+ID4g
Pj4+ICAgIHsKPiA+ID4+PiAgICAgICAgZXZlbnRfbm90aWZpZXJfY2xlYW51cCgmdnEtPmtpY2tf
bm90aWZpZXIpOwo+ID4gPj4+ICsgICAgZXZlbnRfbm90aWZpZXJfc2V0X2hhbmRsZXIoJnZxLT5j
YWxsX25vdGlmaWVyLCBOVUxMKTsKPiA+ID4+PiAgICAgICAgZXZlbnRfbm90aWZpZXJfY2xlYW51
cCgmdnEtPmNhbGxfbm90aWZpZXIpOwo+ID4gPj4+ICAgICAgICBnX2ZyZWUodnEpOwo+ID4gPj4+
ICAgIH0KPiA+ID4+PiBkaWZmIC0tZ2l0IGEvaHcvdmlydGlvL3Zob3N0LXZkcGEuYyBiL2h3L3Zp
cnRpby92aG9zdC12ZHBhLmMKPiA+ID4+PiBpbmRleCBiYzM0ZGUyNDM5Li42YzVmNGM5OGI4IDEw
MDY0NAo+ID4gPj4+IC0tLSBhL2h3L3ZpcnRpby92aG9zdC12ZHBhLmMKPiA+ID4+PiArKysgYi9o
dy92aXJ0aW8vdmhvc3QtdmRwYS5jCj4gPiA+Pj4gQEAgLTcxMiwxMyArNzEyLDQwIEBAIHN0YXRp
YyBib29sIHZob3N0X3ZkcGFfc3ZxX3N0YXJ0X3ZxKHN0cnVjdCB2aG9zdF9kZXYgKmRldiwgdW5z
aWduZWQgaWR4KQo+ID4gPj4+ICAgIHsKPiA+ID4+PiAgICAgICAgc3RydWN0IHZob3N0X3ZkcGEg
KnYgPSBkZXYtPm9wYXF1ZTsKPiA+ID4+PiAgICAgICAgVmhvc3RTaGFkb3dWaXJ0cXVldWUgKnN2
cSA9IGdfcHRyX2FycmF5X2luZGV4KHYtPnNoYWRvd192cXMsIGlkeCk7Cj4gPiA+Pj4gLSAgICBy
ZXR1cm4gdmhvc3Rfc3ZxX3N0YXJ0KGRldiwgaWR4LCBzdnEpOwo+ID4gPj4+ICsgICAgRXZlbnRO
b3RpZmllciAqdmhvc3RfY2FsbF9ub3RpZmllciA9IHZob3N0X3N2cV9nZXRfc3ZxX2NhbGxfbm90
aWZpZXIoc3ZxKTsKPiA+ID4+PiArICAgIHN0cnVjdCB2aG9zdF92cmluZ19maWxlIHZob3N0X2Nh
bGxfZmlsZSA9IHsKPiA+ID4+PiArICAgICAgICAuaW5kZXggPSBpZHggKyBkZXYtPnZxX2luZGV4
LAo+ID4gPj4+ICsgICAgICAgIC5mZCA9IGV2ZW50X25vdGlmaWVyX2dldF9mZCh2aG9zdF9jYWxs
X25vdGlmaWVyKSwKPiA+ID4+PiArICAgIH07Cj4gPiA+Pj4gKyAgICBpbnQgcjsKPiA+ID4+PiAr
ICAgIGJvb2wgYjsKPiA+ID4+PiArCj4gPiA+Pj4gKyAgICAvKiBTZXQgc2hhZG93IHZxIC0+IGd1
ZXN0IG5vdGlmaWVyICovCj4gPiA+Pj4gKyAgICBhc3NlcnQodi0+Y2FsbF9mZFtpZHhdKTsKPiA+
ID4+Cj4gPiA+PiBXZSBuZWVkIGFvdmlkIHRoZSBhc3NlcigpIGhlcmUuIE9uIHdoaWNoIGNhc2Ug
d2UgY2FuIGhpdCB0aGlzPwo+ID4gPj4KPiA+ID4gSSB3b3VsZCBzYXkgdGhhdCB0aGVyZSBpcyBu
byB3YXkgd2UgY2FuIGFjdHVhbGx5IGhpdCBpdCwgc28gbGV0J3MgcmVtb3ZlIGl0Lgo+ID4gPgo+
ID4gPj4+ICsgICAgdmhvc3Rfc3ZxX3NldF9ndWVzdF9jYWxsX25vdGlmaWVyKHN2cSwgdi0+Y2Fs
bF9mZFtpZHhdKTsKPiA+ID4+PiArCj4gPiA+Pj4gKyAgICBiID0gdmhvc3Rfc3ZxX3N0YXJ0KGRl
diwgaWR4LCBzdnEpOwo+ID4gPj4+ICsgICAgaWYgKHVubGlrZWx5KCFiKSkgewo+ID4gPj4+ICsg
ICAgICAgIHJldHVybiBmYWxzZTsKPiA+ID4+PiArICAgIH0KPiA+ID4+PiArCj4gPiA+Pj4gKyAg
ICAvKiBTZXQgZGV2aWNlIC0+IFNWUSBub3RpZmllciAqLwo+ID4gPj4+ICsgICAgciA9IHZob3N0
X3ZkcGFfc2V0X3ZyaW5nX2Rldl9jYWxsKGRldiwgJnZob3N0X2NhbGxfZmlsZSk7Cj4gPiA+Pj4g
KyAgICBpZiAodW5saWtlbHkocikpIHsKPiA+ID4+PiArICAgICAgICBlcnJvcl9yZXBvcnQoInZo
b3N0X3ZkcGFfc2V0X3ZyaW5nX2NhbGwgZm9yIHNoYWRvdyB2cSBmYWlsZWQiKTsKPiA+ID4+PiAr
ICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiA+Pj4gKyAgICB9Cj4gPiA+Pgo+ID4gPj4gU2ltaWxh
ciB0byBraWNrLCBkbyB3ZSBuZWVkIHRvIHNldF92cmluZ19jYWxsKCkgYmVmb3JlIHZob3N0X3N2
cV9zdGFydCgpPwo+ID4gPj4KPiA+ID4gSXQgc2hvdWxkIG5vdCBtYXR0ZXIgYXQgdGhpcyBtb21l
bnQgYmVjYXVzZSB0aGUgZGV2aWNlIHNob3VsZCBub3QgYmUKPiA+ID4gc3RhcnRlZCBhdCB0aGlz
IHBvaW50IGFuZCBkZXZpY2UgY2FsbHMgc2hvdWxkIG5vdCBydW4KPiA+ID4gdmhvc3Rfc3ZxX2hh
bmRsZV9jYWxsIHVudGlsIEJRTCBpcyByZWxlYXNlZC4KPiA+Cj4gPgo+ID4gWWVzLCB3ZSBzdG9w
IHZpcnRxdWV1ZSBiZWZvcmUuCj4gPgo+ID4KPiA+ID4KPiA+ID4gVGhlICJsb2dpYyIgb2YgZG9p
bmcgaXQgYWZ0ZXIgaXMgdG8gbWFrZSBjbGVhciB0aGF0IHN2cSBtdXN0IGJlIGZ1bGx5Cj4gPiA+
IGluaXRpYWxpemVkIGJlZm9yZSBwcm9jZXNzaW5nIGRldmljZSBjYWxscywgZXZlbiBpbiB0aGUg
Y2FzZSB0aGF0IHdlCj4gPiA+IGV4dHJhY3QgU1ZRIGluIGl0cyBvd24gaW90aHJlYWQgb3Igc2lt
aWxhci4gQnV0IHRoaXMgY291bGQgYmUgZG9uZQo+ID4gPiBiZWZvcmUgdmhvc3Rfc3ZxX3N0YXJ0
IGZvciBzdXJlLgo+ID4gPgo+ID4gPj4+ICsKPiA+ID4+PiArICAgIC8qIENoZWNrIGZvciBwZW5k
aW5nIGNhbGxzICovCj4gPiA+Pj4gKyAgICBldmVudF9ub3RpZmllcl9zZXQodmhvc3RfY2FsbF9u
b3RpZmllcik7Cj4gPiA+Pgo+ID4gPj4gSW50ZXJlc3RpbmcsIGNhbiB0aGlzIHJlc3VsdCBzcHVy
aW91cyBpbnRlcnJ1cHQ/Cj4gPiA+Pgo+ID4gPiBUaGlzIGFjdHVhbGx5ICJxdWV1ZXMiIGEgdmhv
c3Rfc3ZxX2hhbmRsZV9jYWxsIGFmdGVyIHRoZSBCUUwgcmVsZWFzZSwKPiA+ID4gd2hlcmUgdGhl
IGRldmljZSBzaG91bGQgYmUgZnVsbHkgcmVzZXQuIEluIHRoYXQgcmVnYXJkLCBpZiB0aGVyZSBh
cmUKPiA+ID4gbm8gdXNlZCBkZXNjcmlwdG9ycyB0aGVyZSB3aWxsIG5vdCBiZSBhbiBpcnEgcmFp
c2VkIHRvIHRoZSBndWVzdC4gRG9lcwo+ID4gPiB0aGF0IGFuc3dlciB0aGUgcXVlc3Rpb24/IE9y
IGhhdmUgSSBtaXNzZWQgc29tZXRoaW5nPwo+ID4KPiA+Cj4gPiBZZXMsIHBsZWFzZSBleHBsYWlu
IHRoaXMgaW4gdGhlIGNvbW1lbnQuCj4gPgo+Cj4gSSdtIHJldmlld2luZyB0aGlzIGFnYWluLCBh
bmQgYWN0dWFsbHkgSSB0aGluayBJIHdhcyB3cm9uZyBpbiBzb2x2aW5nIHRoZSBpc3N1ZS4KPgo+
IFNpbmNlIGF0IHRoaXMgcG9pbnQgdGhlIGRldmljZSBpcyBiZWluZyBjb25maWd1cmVkLCB0aGVy
ZSBpcyBubyBjaGFuY2UKPiB0aGF0IHdlIGhhZCBhIG1pc3NpbmcgY2FsbCBub3RpZmljYXRpb24g
aGVyZTogQSBwcmV2aW91cyBraWNrIGlzCj4gbmVlZGVkIGZvciB0aGUgZGV2aWNlIHRvIGdlbmVy
YXRlIGFueSBjYWxscywgYW5kIHRoZXNlIGNhbm5vdCBiZQo+IHByb2Nlc3NlZC4KPgo+IFdoYXQg
aXMgbm90IHNvbHZlZCBpbiB0aGlzIHNlcmllcyBpcyB0aGF0IHdlIGNvdWxkIGhhdmUgcGVuZGlu
ZyB1c2VkCj4gYnVmZmVycyBpbiB2ZHBhIGRldmljZSBzdG9wcGluZyBTVlEsIGJ1dCBxdWV1aW5n
IGEgY2hlY2sgZm9yIHRoYXQgaXMKPiBub3QgZ29pbmcgdG8gc29sdmUgYW55dGhpbmcsIHNpbmNl
IFNWUSB2cmluZyB3b3VsZCBiZSBhbHJlYWR5Cj4gZGVzdHJveWVkOgo+Cj4gKiB2ZHBhIGRldmlj
ZSBtYXJrcyBOID4gMCBidWZmZXJzIGFzIHVzZWQsIGFuZCBjYWxscy4KPiAqIEJlZm9yZSBwcm9j
ZXNzaW5nIHRoZW0sIFNWUSBzdG9wIGlzIGNhbGxlZC4gU1ZRIGhhdmUgbm90IHByb2Nlc3NlZAo+
IHRoZXNlLCBhbmQgY2xlYW5zIHRoZW0sIG1ha2luZyB0aGlzIGV2ZW50X25vdGlmaWVyX3NldCB1
c2VsZXNzLgo+Cj4gU28gdGhpcyB3b3VsZCByZXF1aXJlIGEgZmV3IGNoYW5nZXMuIE1haW5seSwg
aW5zdGVhZCBvZiBxdWV1ZWluZyBhCj4gY2hlY2sgZm9yIHVzZWQsIHRoZXNlIG5lZWQgdG8gYmUg
Y2hlY2tlZCBiZWZvcmUgc3ZxIGNsZWFuaW5nLiBBZnRlcgo+IHRoYXQsIG9idGFpbiB0aGUgVlEg
c3RhdGUgKGlzIG5vdCBvYnRhaW5lZCBpbiB0aGUgc3RvcCBhdCB0aGUgbW9tZW50LAo+IHRydXN0
aW5nIGluIGd1ZXN0J3MgdXNlZCBpZHgpIGFuZCBydW4gYSBsYXN0Cj4gdmhvc3Rfc3ZxX2hhbmRs
ZV9jYWxsX25vX3Rlc3Qgd2hpbGUgdGhlIGRldmljZSBpcyBwYXVzZWQuCgpJdCBsb29rcyB0byBt
ZSB3aGF0J3MgcmVhbGx5IGltcG9ydGFudCBpcyB0aGF0IFNWUSBuZWVkcyB0bwpkcmFpbi9mb3J3
YXJlZCB1c2VkIGJ1ZmZlcnMgYWZ0ZXIgdmRwYSBpcyBzdG9wcGVkLiBUaGVuIHdlIHNob3VsZCBi
ZQpmaW5lLgoKPgo+IFRoYW5rcyEKPgo+ID4KPiA+ID4KPiA+ID4+PiArICAgIHJldHVybiB0cnVl
Owo+ID4gPj4+ICAgIH0KPiA+ID4+Pgo+ID4gPj4+ICAgIHN0YXRpYyB1bnNpZ25lZCB2aG9zdF92
ZHBhX2VuYWJsZV9zdnEoc3RydWN0IHZob3N0X3ZkcGEgKnYsIGJvb2wgZW5hYmxlKQo+ID4gPj4+
ICAgIHsKPiA+ID4+PiAgICAgICAgc3RydWN0IHZob3N0X2RldiAqaGRldiA9IHYtPmRldjsKPiA+
ID4+PiAgICAgICAgdW5zaWduZWQgbjsKPiA+ID4+PiArICAgIGludCByOwo+ID4gPj4+Cj4gPiA+
Pj4gICAgICAgIGlmIChlbmFibGUgPT0gdi0+c2hhZG93X3Zxc19lbmFibGVkKSB7Cj4gPiA+Pj4g
ICAgICAgICAgICByZXR1cm4gaGRldi0+bnZxczsKPiA+ID4+PiBAQCAtNzUyLDkgKzc3OSwxOCBA
QCBzdGF0aWMgdW5zaWduZWQgdmhvc3RfdmRwYV9lbmFibGVfc3ZxKHN0cnVjdCB2aG9zdF92ZHBh
ICp2LCBib29sIGVuYWJsZSkKPiA+ID4+PiAgICAgICAgaWYgKCFlbmFibGUpIHsKPiA+ID4+PiAg
ICAgICAgICAgIC8qIERpc2FibGUgYWxsIHF1ZXVlcyBvciBjbGVhbiB1cCBmYWlsZWQgc3RhcnQg
Ki8KPiA+ID4+PiAgICAgICAgICAgIGZvciAobiA9IDA7IG4gPCB2LT5zaGFkb3dfdnFzLT5sZW47
ICsrbikgewo+ID4gPj4+ICsgICAgICAgICAgICBzdHJ1Y3Qgdmhvc3RfdnJpbmdfZmlsZSBmaWxl
ID0gewo+ID4gPj4+ICsgICAgICAgICAgICAgICAgLmluZGV4ID0gdmhvc3RfdmRwYV9nZXRfdnFf
aW5kZXgoaGRldiwgbiksCj4gPiA+Pj4gKyAgICAgICAgICAgICAgICAuZmQgPSB2LT5jYWxsX2Zk
W25dLAo+ID4gPj4+ICsgICAgICAgICAgICB9Owo+ID4gPj4+ICsKPiA+ID4+PiArICAgICAgICAg
ICAgciA9IHZob3N0X3ZkcGFfc2V0X3ZyaW5nX2NhbGwoaGRldiwgJmZpbGUpOwo+ID4gPj4+ICsg
ICAgICAgICAgICBhc3NlcnQociA9PSAwKTsKPiA+ID4+PiArCj4gPiA+Pj4gICAgICAgICAgICAg
ICAgdW5zaWduZWQgdnFfaWR4ID0gdmhvc3RfdmRwYV9nZXRfdnFfaW5kZXgoaGRldiwgbik7Cj4g
PiA+Pj4gICAgICAgICAgICAgICAgVmhvc3RTaGFkb3dWaXJ0cXVldWUgKnN2cSA9IGdfcHRyX2Fy
cmF5X2luZGV4KHYtPnNoYWRvd192cXMsIG4pOwo+ID4gPj4+ICAgICAgICAgICAgICAgIHZob3N0
X3N2cV9zdG9wKGhkZXYsIG4sIHN2cSk7Cj4gPiA+Pj4gKyAgICAgICAgICAgIC8qIFRPRE86IFRo
aXMgY2FuIHVubWFzayBvciBvdmVycmlkZSBjYWxsIGZkISAqLwo+ID4gPj4KPiA+ID4+IEkgZG9u
J3QgZ2V0IHRoaXMgY29tbWVudC4gRG9lcyB0aGlzIG1lYW4gdGhlIGN1cnJlbnQgY29kZSBjYW4n
dCB3b3JrCj4gPiA+PiB3aXRoIG1hc2tfbm90aWZpZXJzPyBJZiB5ZXMsIHRoaXMgaXMgc29tZXRo
aW5nIHdlIG5lZWQgdG8gZml4Lgo+ID4gPj4KPiA+ID4gWWVzLCBidXQgaXQgd2lsbCBiZSBhZGRy
ZXNzZWQgaW4gdGhlIG5leHQgc2VyaWVzLiBJIHNob3VsZCBoYXZlCj4gPiA+IGV4cGxhaW5lZCBp
dCBiZXR0ZSBoZXJlLCBzb3JyeSA6KS4KPiA+Cj4gPgo+ID4gT2suCj4gPgo+ID4gVGhhbmtzCj4g
Pgo+ID4KPiA+ID4KPiA+ID4gVGhhbmtzIQo+ID4gPgo+ID4gPj4gVGhhbmtzCj4gPiA+Pgo+ID4g
Pj4KPiA+ID4+PiAgICAgICAgICAgICAgICB2aG9zdF92aXJ0cXVldWVfc3RhcnQoaGRldiwgaGRl
di0+dmRldiwgJmhkZXYtPnZxc1tuXSwgdnFfaWR4KTsKPiA+ID4+PiAgICAgICAgICAgIH0KPiA+
ID4+Pgo+ID4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
