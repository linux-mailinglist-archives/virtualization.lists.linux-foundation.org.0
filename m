Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D37A6D58CA
	for <lists.virtualization@lfdr.de>; Tue,  4 Apr 2023 08:35:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13C3560881;
	Tue,  4 Apr 2023 06:35:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13C3560881
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gLsaCOiz
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gz14lSUX4eSP; Tue,  4 Apr 2023 06:35:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 56962607FE;
	Tue,  4 Apr 2023 06:35:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56962607FE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 80E70C0089;
	Tue,  4 Apr 2023 06:35:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1E37BC002F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Apr 2023 06:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F34B140129
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Apr 2023 06:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F34B140129
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=gLsaCOiz
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cfcbSMGJYsTT
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Apr 2023 06:35:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C512C4010D
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C512C4010D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Apr 2023 06:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680590119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CUX74SgqHChWU1+Vc5/47wMgpih/X2QF6nAAh+toOCI=;
 b=gLsaCOizWmBUPbvBdZ8bxZ9EAsqsa/M+H+u4LNBxhGoZbcfJ0m0VOPYUDe7eYQwBsqFMgj
 sVoy3riz2HDWEd45LaSMP3SEoPEpZmkvIrnX/MxSWOqViC+BmNfpGE4X8QlcjuDYoZTb5y
 1nfHUccLa7bisCZ6ncHTDv/uQ62fsu0=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-jOLln323OaWAFWmgDZPblQ-1; Tue, 04 Apr 2023 02:35:18 -0400
X-MC-Unique: jOLln323OaWAFWmgDZPblQ-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-18032227bc5so6716686fac.9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 03 Apr 2023 23:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680590117; x=1683182117;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CUX74SgqHChWU1+Vc5/47wMgpih/X2QF6nAAh+toOCI=;
 b=lKDwgvt2/4FZ8abQ94DrsFt9jiZu9VtCVehw8l0Ri9NwPPwr0NYuii1eHPtXwtEujc
 zF2TPDNGky4uivO0MkaceVAoMsCt2x6T8FtC4U5YQFOg/qYZQPaViGTSxcgpbDU2iSV+
 BwqZ9nxjwEZiR1kEVS3bioxs8k/sB2CvCuvvw97FW2eHVOrwvCEfB7BQl89knWGZ1xfm
 9ipcZ1ZHaOHf4bV+NXzTlbmFHEPU5/LhURJND2O7kkbUsUHWCtr537tdv9lxl7vaslVu
 krNvgeBJ3TvGuHOK4D7Ip4uCDqNfEjaJHZpkACumyoFc5Ex+7j+0WAKD3JXVCt4xBFjJ
 zlbA==
X-Gm-Message-State: AAQBX9eP36As8l0NT6VITtbCOzVJWQu4fBYMku2TdVqLWHP5liLf/uYv
 ce+RwICz6TbrjaZrNO+qhdJ+wguSH/IrNet+LoeCzDRHdhh0REUw8tD62ejcbNSliaMRgOz1iL4
 BH3r3nXKqbA+hGc9xLB89B8iodyFHmCQCw4QugIof5Q4839HZVcqe8DsX2A==
X-Received: by 2002:a9d:6a5a:0:b0:69f:8fa8:1a4f with SMTP id
 h26-20020a9d6a5a000000b0069f8fa81a4fmr553937otn.2.1680590116957; 
 Mon, 03 Apr 2023 23:35:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y++WC9gOaPYM92sK4/+TiZBLTDwDmLqb4W8fKF399Z4Ob+lrXW39jbxqfM/XTS7eNOHz/bhxMjNkRQ3jw8WHY=
X-Received: by 2002:a9d:6a5a:0:b0:69f:8fa8:1a4f with SMTP id
 h26-20020a9d6a5a000000b0069f8fa81a4fmr553925otn.2.1680590116640; Mon, 03 Apr
 2023 23:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230328120412.110114-1-xuanzhuo@linux.alibaba.com>
 <20230328120412.110114-4-xuanzhuo@linux.alibaba.com>
 <CACGkMEvZ=-G4QVTDnoSa1N0UspW8u_oz-7xosrXV0f1YcytVXw@mail.gmail.com>
 <1680495148.1559556-3-xuanzhuo@linux.alibaba.com>
 <CACGkMEvfTE1F7Wa3P2do1o+149kSdGkjyVYt6e4r2r5UQZ6ocA@mail.gmail.com>
 <1680588670.6153247-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1680588670.6153247-1-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 4 Apr 2023 14:35:05 +0800
Message-ID: <CACGkMEtTFk40ShdgyAJeBrUphZnMgk-RE0RpcHyc1uvSNoXAOA@mail.gmail.com>
Subject: Re: [PATCH net-next 3/8] virtio_net: introduce virtnet_xdp_handler()
 to seprate the logic of run xdp
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, virtualization@lists.linux-foundation.org,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
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

T24gVHVlLCBBcHIgNCwgMjAyMyBhdCAyOjIy4oCvUE0gWHVhbiBaaHVvIDx4dWFuemh1b0BsaW51
eC5hbGliYWJhLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIDQgQXByIDIwMjMgMTM6MDQ6MDIgKzA4
MDAsIEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gT24gTW9uLCBB
cHIgMywgMjAyMyBhdCAxMjoxN+KAr1BNIFh1YW4gWmh1byA8eHVhbnpodW9AbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBNb24sIDMgQXByIDIwMjMgMTA6NDM6MDMgKzA4
MDAsIEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gPiA+IE9uIFR1
ZSwgTWFyIDI4LCAyMDIzIGF0IDg6MDTigK9QTSBYdWFuIFpodW8gPHh1YW56aHVvQGxpbnV4LmFs
aWJhYmEuY29tPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBBdCBwcmVzZW50LCB3ZSBoYXZl
IHR3byBzaW1pbGFyIGxvZ2ljIHRvIHBlcmZvcm0gdGhlIFhEUCBwcm9nLgo+ID4gPiA+ID4KPiA+
ID4gPiA+IFRoZXJlZm9yZSwgdGhpcyBQQVRDSCBzZXBhcmF0ZXMgdGhlIGNvZGUgb2YgZXhlY3V0
aW5nIFhEUCwgd2hpY2ggaXMKPiA+ID4gPiA+IGNvbmR1Y2l2ZSB0byBsYXRlciBtYWludGVuYW5j
ZS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBYdWFuIFpodW8gPHh1YW56aHVv
QGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgZHJpdmVycy9uZXQv
dmlydGlvX25ldC5jIHwgMTQyICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LQo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3NSBpbnNlcnRpb25zKCspLCA2NyBkZWxldGlv
bnMoLSkKPiA+ID4gPiA+Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvdmlydGlv
X25ldC5jIGIvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4gPiA+ID4gPiBpbmRleCBiYjQyNjk1
OGNkZDQuLjcyYjlkNmVlNDAyNCAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvbmV0L3Zp
cnRpb19uZXQuYwo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4gPiA+
ID4gPiBAQCAtMzAxLDYgKzMwMSwxNSBAQCBzdHJ1Y3QgcGFkZGVkX3ZuZXRfaGRyIHsKPiA+ID4g
PiA+ICAgICAgICAgY2hhciBwYWRkaW5nWzEyXTsKPiA+ID4gPiA+ICB9Owo+ID4gPiA+ID4KPiA+
ID4gPiA+ICtlbnVtIHsKPiA+ID4gPiA+ICsgICAgICAgLyogeGRwIHBhc3MgKi8KPiA+ID4gPiA+
ICsgICAgICAgVklSVE5FVF9YRFBfUkVTX1BBU1MsCj4gPiA+ID4gPiArICAgICAgIC8qIGRyb3Ag
cGFja2V0LiB0aGUgY2FsbGVyIG5lZWRzIHRvIHJlbGVhc2UgdGhlIHBhZ2UuICovCj4gPiA+ID4g
PiArICAgICAgIFZJUlRORVRfWERQX1JFU19EUk9QLAo+ID4gPiA+ID4gKyAgICAgICAvKiBwYWNr
ZXQgaXMgY29uc3VtZWQgYnkgeGRwLiB0aGUgY2FsbGVyIG5lZWRzIHRvIGRvIG5vdGhpbmcuICov
Cj4gPiA+ID4gPiArICAgICAgIFZJUlRORVRfWERQX1JFU19DT05TVU1FRCwKPiA+ID4gPiA+ICt9
Owo+ID4gPiA+Cj4gPiA+ID4gSSdkIHByZWZlciB0aGlzIHRvIGJlIGRvbmUgb24gdG9wIHVubGVz
cyBpdCBpcyBhIG11c3QuIEJ1dCBJIGRvbid0IHNlZQo+ID4gPiA+IGFueSBhZHZhbnRhZ2Ugb2Yg
aW50cm9kdWNpbmcgdGhpcywgaXQncyBwYXJ0aWFsIG1hcHBpbmcgb2YgWERQIGFjdGlvbgo+ID4g
PiA+IGFuZCBpdCBuZWVkcyB0byBiZSBleHRlbmRlZCB3aGVuIFhEUCBhY3Rpb24gaXMgZXh0ZW5k
ZWQuIChBbmQgd2UndmUKPiA+ID4gPiBhbHJlYWR5IGhhZDogVklSVElPX1hEUF9SRURJUiBhbmQg
VklSVElPX1hEUF9UWCAuLi4pCj4gPiA+Cj4gPiA+IE5vLCB0aGVzZSBhcmUgdGhlIHRocmVlIHN0
YXRlcyBvZiBidWZmZXIgYWZ0ZXIgWERQIHByb2Nlc3NpbmcuCj4gPiA+Cj4gPiA+ICogUEFTUzog
Z290byBtYWtlIHNrYgo+ID4KPiA+IFhEUF9QQVNTIGdvZXMgZm9yIHRoaXMuCj4gPgo+ID4gPiAq
IERST1A6IHdlIHNob3VsZCByZWxlYXNlIGJ1ZmZlcgo+ID4KPiA+IFhEUF9EUk9QIGFuZCBlcnJv
ciBjb25kaXRpb25zIGdvIHdpdGggdGhpcy4KPiA+Cj4gPiA+ICogQ1VOU1VNRUQ6IHhkcCBwcm9n
IHVzZWQgdGhlIGJ1ZmZlciwgd2UgZG8gbm90aGluZwo+ID4KPiA+IFhEUF9UWC9YRFBfUkVESVJF
Q1RJT04gZ29lcyBmb3IgdGhpcy4KPiA+Cj4gPiBTbyB0IHZpcnRuZXRfeGRwX2hhbmRsZXIoKSBq
dXN0IG1hcHMgWERQIEFDVElPTiBwbHVzIHRoZSBlcnJvcgo+ID4gY29uZGl0aW9ucyB0byB0aGUg
YWJvdmUgdGhyZWUgc3RhdGVzLgo+ID4KPiA+IFdlIGNhbiBzaW1wbHkgbWFwIGVycm9yIHRvIFhE
UF9EUk9QIGxpa2U6Cj4gPgo+ID4gICAgICAgIGNhc2UgWERQX1RYOgo+ID4gICAgICAgICAgICAg
ICBzdGF0cy0+eGRwX3R4Kys7Cj4gPiAgICAgICAgICAgICAgICB4ZHBmID0geGRwX2NvbnZlcnRf
YnVmZl90b19mcmFtZSh4ZHApOwo+ID4gICAgICAgICAgICAgICAgaWYgKHVubGlrZWx5KCF4ZHBm
KSkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFhEUF9EUk9QOwo+ID4KPiA+IEEg
Z29vZCBzaWRlIGVmZmVjdCBpcyB0byBhdm9pZCB0aGUgeGRwX3htaXQgcG9pbnRlciB0byBiZSBw
YXNzZWQgdG8KPiA+IHRoZSBmdW5jdGlvbi4KPgo+Cj4gU28sIEkgZ3Vlc3MgeW91IG1lYW4gdGhp
czoKPgo+ICAgICAgICAgc3dpdGNoIChhY3QpIHsKPiAgICAgICAgIGNhc2UgWERQX1BBU1M6Cj4g
ICAgICAgICAgICAgICAgIC8qIGhhbmRsZSBwYXNzICovCj4gICAgICAgICAgICAgICAgIHJldHVy
biBza2I7Cj4KPiAgICAgICAgIGNhc2UgWERQX1RYOgo+ICAgICAgICAgICAgICAgICAqeGRwX3ht
aXQgfD0gVklSVElPX1hEUF9UWDsKPiAgICAgICAgICAgICAgICAgZ290byB4bWl0Owo+Cj4gICAg
ICAgICBjYXNlIFhEUF9SRURJUkVDVDoKPiAgICAgICAgICAgICAgICAgKnhkcF94bWl0IHw9IFZJ
UlRJT19YRFBfUkVESVI7Cj4gICAgICAgICAgICAgICAgIGdvdG8geG1pdDsKPgo+ICAgICAgICAg
Y2FzZSBYRFBfRFJPUDoKPiAgICAgICAgIGRlZmF1bHQ6Cj4gICAgICAgICAgICAgICAgIGdvdG8g
ZXJyX3hkcDsKPiAgICAgICAgIH0KPgo+IEkgaGF2ZSB0byBzYXkgdGhlcmUgaXMgbm8gcHJvYmxl
bSBmcm9tIHRoZSBwZXJzcGVjdGl2ZSBvZiBjb2RlIGltcGxlbWVudGF0aW9uLgoKTm90ZSB0aGF0
IHRoaXMgaXMgdGhlIGN1cnJlbnQgbG9naWMgd2hlcmUgaXQgaXMgZGV0ZXJtaW5lZCBpbgpyZWNl
aXZlX3NtYWxsKCkgYW5kIHJlY2VpdmVfbWVyZ2VhYmxlKCkuCgo+Cj4gQnV0IGlmIHRoZSBhIG5l
dyBBQ1RJT04gbGlraW5nIFhEUF9UWCxYRFBfUkVESVJFQ1QgaXMgYWRkZWQgaW4gdGhlIGZ1dHVy
ZSwgdGhlbgo+IHdlIG11c3QgbW9kaWZ5IGFsbCB0aGUgY2FsbGVycy4KClRoaXMgaXMgZmluZSBz
aW5jZSB3ZSBvbmx5IHVzZSBhIHNpbmdsZSB0eXBlIGZvciBYRFAgYWN0aW9uLgoKPiBUaGlzIGlz
IHRoZSBiZW5lZml0IG9mIHVzaW5nIENVTlNVTUVELgoKSXQncyB2ZXJ5IGhhcmQgdG8gc2F5LCBl
LmcgaWYgd2Ugd2FudCB0byBzdXBwb3J0IGNsb25pbmcgaW4gdGhlIGZ1dHVyZS4KCj4KPiBJIHRo
aW5rIGl0IGlzIGEgZ29vZCBhZHZhbnRhZ2UgdG8gcHV0IHhkcF94bWl0IGluIHZpcnRuZXRfeGRw
X2hhbmRsZXIoKSwKPiB3aGljaCBtYWtlcyB0aGUgY2FsbGVyIG5vdCBjYXJlIHRvbyBtdWNoIGFi
b3V0IHRoZXNlIGRldGFpbHMuCgpUaGlzIHBhcnQgSSBkb24ndCB1bmRlcnN0YW5kLCBoYXZpbmcg
eGRwX3htaXQgbWVhbnMgdGhlIGNhbGxlciBuZWVkIHRvCmtub3cgd2hldGhlciBpdCBpcyB4bWl0
ZWQgb3IgcmVkaXJlY3RlZC4gVGhlIHBvaW50IG9mIHRoZSBlbnVtIGlzIHRvCmhpZGUgdGhlIFhE
UCBhY3Rpb25zLCBidXQgaXQncyBjb25mbGljdCB3aXRoIHdoYXQgeGRwX3htaXQgd2hvIHdhbnQg
dG8KZXhwb3NlIChwYXJ0IG9mKSB0aGUgWERQIGFjdGlvbnMuCgo+IElmIHlvdSB0YWtlIGludG8K
PiBhY2NvdW50IHRoZSBwcm9ibGVtIG9mIGluY3JlYXNpbmcgdGhlIG51bWJlciBvZiBwYXJhbWV0
ZXJzLCBJIGFkdmlzZSB0byBwdXQgaXQKPiBpbiBycS4KCkkgZG9uJ3QgaGF2ZSBzdHJvbmcgb3Bp
bmlvbiB0byBpbnRyb2R1Y2UgdGhlIGVudW0sIHdoYXQgSSB3YW50IHRvIHNheQppcywgdXNlIGEg
c2VwYXJhdGVkIHBhdGNoIHRvIGRvIHRoYXQuCgpUaGFua3MKCj4KPiBUaGFua3MuCj4KPgo+Cj4g
Pgo+ID4gPgo+ID4gPiBUaGUgbGF0dGVyIHR3byBhcmUgbm90IHBhcnRpY3VsYXJseSByZWxhdGVk
IHRvIFhEUCBBQ1RJT04uIEFuZCBpdCBkb2VzIG5vdCBuZWVkCj4gPiA+IHRvIGV4dGVuZCB3aGVu
IFhEUCBhY3Rpb24gaXMgZXh0ZW5kZWQuIEF0IGxlYXN0IEkgaGF2ZSBub3QgdGhvdWdodCBvZiB0
aGlzCj4gPiA+IHNpdHVhdGlvbi4KPiA+Cj4gPiBXaGF0J3MgdGhlIGFkdmFudGFnZXMgb2Ygc3Vj
aCBpbmRpcmVjdGlvbiBjb21wYXJlZCB0byB1c2luZyBYRFAgYWN0aW9uIGRpcmVjdGx5Pwo+ID4K
PiA+IFRoYW5rcwo+ID4KPiA+ID4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+ID4gKwo+ID4gPiA+ID4g
IHN0YXRpYyB2b2lkIHZpcnRuZXRfcnFfZnJlZV91bnVzZWRfYnVmKHN0cnVjdCB2aXJ0cXVldWUg
KnZxLCB2b2lkICpidWYpOwo+ID4gPiA+ID4gIHN0YXRpYyB2b2lkIHZpcnRuZXRfc3FfZnJlZV91
bnVzZWRfYnVmKHN0cnVjdCB2aXJ0cXVldWUgKnZxLCB2b2lkICpidWYpOwo+ID4gPiA+ID4KPiA+
ID4gPiA+IEBAIC03ODksNiArNzk4LDU5IEBAIHN0YXRpYyBpbnQgdmlydG5ldF94ZHBfeG1pdChz
dHJ1Y3QgbmV0X2RldmljZSAqZGV2LAo+ID4gPiA+ID4gICAgICAgICByZXR1cm4gcmV0Owo+ID4g
PiA+ID4gIH0KPiA+ID4gPiA+Cj4gPiA+ID4gPiArc3RhdGljIGludCB2aXJ0bmV0X3hkcF9oYW5k
bGVyKHN0cnVjdCBicGZfcHJvZyAqeGRwX3Byb2csIHN0cnVjdCB4ZHBfYnVmZiAqeGRwLAo+ID4g
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBuZXRfZGV2aWNlICpk
ZXYsCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50
ICp4ZHBfeG1pdCwKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3QgdmlydG5ldF9ycV9zdGF0cyAqc3RhdHMpCj4gPiA+ID4gPiArewo+ID4gPiA+ID4gKyAgICAg
ICBzdHJ1Y3QgeGRwX2ZyYW1lICp4ZHBmOwo+ID4gPiA+ID4gKyAgICAgICBpbnQgZXJyOwo+ID4g
PiA+ID4gKyAgICAgICB1MzIgYWN0Owo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICBhY3Qg
PSBicGZfcHJvZ19ydW5feGRwKHhkcF9wcm9nLCB4ZHApOwo+ID4gPiA+ID4gKyAgICAgICBzdGF0
cy0+eGRwX3BhY2tldHMrKzsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgICAgc3dpdGNoIChh
Y3QpIHsKPiA+ID4gPiA+ICsgICAgICAgY2FzZSBYRFBfUEFTUzoKPiA+ID4gPiA+ICsgICAgICAg
ICAgICAgICByZXR1cm4gVklSVE5FVF9YRFBfUkVTX1BBU1M7Cj4gPiA+ID4gPiArCj4gPiA+ID4g
PiArICAgICAgIGNhc2UgWERQX1RYOgo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHN0YXRzLT54
ZHBfdHgrKzsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICB4ZHBmID0geGRwX2NvbnZlcnRfYnVm
Zl90b19mcmFtZSh4ZHApOwo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGlmICh1bmxpa2VseSgh
eGRwZikpCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gVklSVE5FVF9Y
RFBfUkVTX0RST1A7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgZXJyID0g
dmlydG5ldF94ZHBfeG1pdChkZXYsIDEsICZ4ZHBmLCAwKTsKPiA+ID4gPiA+ICsgICAgICAgICAg
ICAgICBpZiAodW5saWtlbHkoIWVycikpIHsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHhkcF9yZXR1cm5fZnJhbWVfcnhfbmFwaSh4ZHBmKTsKPiA+ID4gPiA+ICsgICAgICAgICAg
ICAgICB9IGVsc2UgaWYgKHVubGlrZWx5KGVyciA8IDApKSB7Cj4gPiA+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICB0cmFjZV94ZHBfZXhjZXB0aW9uKGRldiwgeGRwX3Byb2csIGFjdCk7Cj4g
PiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gVklSVE5FVF9YRFBfUkVTX0RS
T1A7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgfQo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAg
ICAgICAgICAgICAgICp4ZHBfeG1pdCB8PSBWSVJUSU9fWERQX1RYOwo+ID4gPiA+ID4gKyAgICAg
ICAgICAgICAgIHJldHVybiBWSVJUTkVUX1hEUF9SRVNfQ09OU1VNRUQ7Cj4gPiA+ID4gPiArCj4g
PiA+ID4gPiArICAgICAgIGNhc2UgWERQX1JFRElSRUNUOgo+ID4gPiA+ID4gKyAgICAgICAgICAg
ICAgIHN0YXRzLT54ZHBfcmVkaXJlY3RzKys7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgZXJy
ID0geGRwX2RvX3JlZGlyZWN0KGRldiwgeGRwLCB4ZHBfcHJvZyk7Cj4gPiA+ID4gPiArICAgICAg
ICAgICAgICAgaWYgKGVycikKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
biBWSVJUTkVUX1hEUF9SRVNfRFJPUDsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgICAgICAg
ICAgICAqeGRwX3htaXQgfD0gVklSVElPX1hEUF9SRURJUjsKPiA+ID4gPiA+ICsgICAgICAgICAg
ICAgICByZXR1cm4gVklSVE5FVF9YRFBfUkVTX0NPTlNVTUVEOwo+ID4gPiA+ID4gKwo+ID4gPiA+
ID4gKyAgICAgICBkZWZhdWx0Ogo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGJwZl93YXJuX2lu
dmFsaWRfeGRwX2FjdGlvbihkZXYsIHhkcF9wcm9nLCBhY3QpOwo+ID4gPiA+ID4gKyAgICAgICAg
ICAgICAgIGZhbGx0aHJvdWdoOwo+ID4gPiA+ID4gKyAgICAgICBjYXNlIFhEUF9BQk9SVEVEOgo+
ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHRyYWNlX3hkcF9leGNlcHRpb24oZGV2LCB4ZHBfcHJv
ZywgYWN0KTsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBmYWxsdGhyb3VnaDsKPiA+ID4gPiA+
ICsgICAgICAgY2FzZSBYRFBfRFJPUDoKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4g
VklSVE5FVF9YRFBfUkVTX0RST1A7Cj4gPiA+ID4gPiArICAgICAgIH0KPiA+ID4gPiA+ICt9Cj4g
PiA+ID4gPiArCj4gPiA+ID4gPiAgc3RhdGljIHVuc2lnbmVkIGludCB2aXJ0bmV0X2dldF9oZWFk
cm9vbShzdHJ1Y3QgdmlydG5ldF9pbmZvICp2aSkKPiA+ID4gPiA+ICB7Cj4gPiA+ID4gPiAgICAg
ICAgIHJldHVybiB2aS0+eGRwX2VuYWJsZWQgPyBWSVJUSU9fWERQX0hFQURST09NIDogMDsKPiA+
ID4gPiA+IEBAIC04NzYsNyArOTM4LDYgQEAgc3RhdGljIHN0cnVjdCBza19idWZmICpyZWNlaXZl
X3NtYWxsKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYsCj4gPiA+ID4gPiAgICAgICAgIHN0cnVjdCBw
YWdlICpwYWdlID0gdmlydF90b19oZWFkX3BhZ2UoYnVmKTsKPiA+ID4gPiA+ICAgICAgICAgdW5z
aWduZWQgaW50IGRlbHRhID0gMDsKPiA+ID4gPiA+ICAgICAgICAgc3RydWN0IHBhZ2UgKnhkcF9w
YWdlOwo+ID4gPiA+ID4gLSAgICAgICBpbnQgZXJyOwo+ID4gPiA+ID4gICAgICAgICB1bnNpZ25l
ZCBpbnQgbWV0YXNpemUgPSAwOwo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICAgICAgbGVuIC09IHZp
LT5oZHJfbGVuOwo+ID4gPiA+ID4gQEAgLTg5OCw3ICs5NTksNiBAQCBzdGF0aWMgc3RydWN0IHNr
X2J1ZmYgKnJlY2VpdmVfc21hbGwoc3RydWN0IG5ldF9kZXZpY2UgKmRldiwKPiA+ID4gPiA+ICAg
ICAgICAgeGRwX3Byb2cgPSByY3VfZGVyZWZlcmVuY2UocnEtPnhkcF9wcm9nKTsKPiA+ID4gPiA+
ICAgICAgICAgaWYgKHhkcF9wcm9nKSB7Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgc3RydWN0
IHZpcnRpb19uZXRfaGRyX21yZ19yeGJ1ZiAqaGRyID0gYnVmICsgaGVhZGVyX29mZnNldDsKPiA+
ID4gPiA+IC0gICAgICAgICAgICAgICBzdHJ1Y3QgeGRwX2ZyYW1lICp4ZHBmOwo+ID4gPiA+ID4g
ICAgICAgICAgICAgICAgIHN0cnVjdCB4ZHBfYnVmZiB4ZHA7Cj4gPiA+ID4gPiAgICAgICAgICAg
ICAgICAgdm9pZCAqb3JpZ19kYXRhOwo+ID4gPiA+ID4gICAgICAgICAgICAgICAgIHUzMiBhY3Q7
Cj4gPiA+ID4gPiBAQCAtOTMxLDQ2ICs5OTEsMjIgQEAgc3RhdGljIHN0cnVjdCBza19idWZmICpy
ZWNlaXZlX3NtYWxsKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYsCj4gPiA+ID4gPiAgICAgICAgICAg
ICAgICAgeGRwX3ByZXBhcmVfYnVmZigmeGRwLCBidWYgKyBWSVJUTkVUX1JYX1BBRCArIHZpLT5o
ZHJfbGVuLAo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgeGRwX2hl
YWRyb29tLCBsZW4sIHRydWUpOwo+ID4gPiA+ID4gICAgICAgICAgICAgICAgIG9yaWdfZGF0YSA9
IHhkcC5kYXRhOwo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgIGFjdCA9IGJwZl9wcm9nX3J1bl94
ZHAoeGRwX3Byb2csICZ4ZHApOwo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgIHN0YXRzLT54ZHBf
cGFja2V0cysrOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGFjdCA9IHZp
cnRuZXRfeGRwX2hhbmRsZXIoeGRwX3Byb2csICZ4ZHAsIGRldiwgeGRwX3htaXQsIHN0YXRzKTsK
PiA+ID4gPiA+Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgc3dpdGNoIChhY3QpIHsKPiA+ID4g
PiA+IC0gICAgICAgICAgICAgICBjYXNlIFhEUF9QQVNTOgo+ID4gPiA+ID4gKyAgICAgICAgICAg
ICAgIGNhc2UgVklSVE5FVF9YRFBfUkVTX1BBU1M6Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAvKiBSZWNhbGN1bGF0ZSBsZW5ndGggaW4gY2FzZSBicGYgcHJvZ3JhbSBjaGFuZ2Vk
IGl0ICovCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBkZWx0YSA9IG9yaWdfZGF0
YSAtIHhkcC5kYXRhOwo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgbGVuID0geGRw
LmRhdGFfZW5kIC0geGRwLmRhdGE7Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBt
ZXRhc2l6ZSA9IHhkcC5kYXRhIC0geGRwLmRhdGFfbWV0YTsKPiA+ID4gPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgIGNhc2UgWERQX1RY
Ogo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgc3RhdHMtPnhkcF90eCsrOwo+ID4g
PiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgeGRwZiA9IHhkcF9jb252ZXJ0X2J1ZmZfdG9f
ZnJhbWUoJnhkcCk7Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBpZiAodW5saWtl
bHkoIXhkcGYpKQo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3Rv
IGVycl94ZHA7Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBlcnIgPSB2aXJ0bmV0
X3hkcF94bWl0KGRldiwgMSwgJnhkcGYsIDApOwo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKHVubGlrZWx5KCFlcnIpKSB7Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHhkcF9yZXR1cm5fZnJhbWVfcnhfbmFwaSh4ZHBmKTsKPiA+ID4gPiA+IC0g
ICAgICAgICAgICAgICAgICAgICAgIH0gZWxzZSBpZiAodW5saWtlbHkoZXJyIDwgMCkpIHsKPiA+
ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdHJhY2VfeGRwX2V4Y2VwdGlv
bih2aS0+ZGV2LCB4ZHBfcHJvZywgYWN0KTsKPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZ290byBlcnJfeGRwOwo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAg
ICAgfQo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgKnhkcF94bWl0IHw9IFZJUlRJ
T19YRFBfVFg7Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICByY3VfcmVhZF91bmxv
Y2soKTsKPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGdvdG8geGRwX3htaXQ7Cj4g
PiA+ID4gPiAtICAgICAgICAgICAgICAgY2FzZSBYRFBfUkVESVJFQ1Q6Cj4gPiA+ID4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICBzdGF0cy0+eGRwX3JlZGlyZWN0cysrOwo+ID4gPiA+ID4gLSAg
ICAgICAgICAgICAgICAgICAgICAgZXJyID0geGRwX2RvX3JlZGlyZWN0KGRldiwgJnhkcCwgeGRw
X3Byb2cpOwo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgaWYgKGVycikKPiA+ID4g
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnJfeGRwOwo+ID4gPiA+
ID4gLSAgICAgICAgICAgICAgICAgICAgICAgKnhkcF94bWl0IHw9IFZJUlRJT19YRFBfUkVESVI7
Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgY2FzZSBWSVJUTkVUX1hEUF9S
RVNfQ09OU1VNRUQ6Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICByY3VfcmVhZF91
bmxvY2soKTsKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8geGRwX3htaXQ7
Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgZGVmYXVsdDoKPiA+ID4gPiA+IC0gICAgICAgICAg
ICAgICAgICAgICAgIGJwZl93YXJuX2ludmFsaWRfeGRwX2FjdGlvbih2aS0+ZGV2LCB4ZHBfcHJv
ZywgYWN0KTsKPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGZhbGx0aHJvdWdoOwo+
ID4gPiA+ID4gLSAgICAgICAgICAgICAgIGNhc2UgWERQX0FCT1JURUQ6Cj4gPiA+ID4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICB0cmFjZV94ZHBfZXhjZXB0aW9uKHZpLT5kZXYsIHhkcF9wcm9n
LCBhY3QpOwo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnJfeGRwOwo+
ID4gPiA+ID4gLSAgICAgICAgICAgICAgIGNhc2UgWERQX0RST1A6Cj4gPiA+ID4gPiArCj4gPiA+
ID4gPiArICAgICAgICAgICAgICAgY2FzZSBWSVJUTkVUX1hEUF9SRVNfRFJPUDoKPiA+ID4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyX3hkcDsKPiA+ID4gPiA+ICAgICAgICAg
ICAgICAgICB9Cj4gPiA+ID4gPiAgICAgICAgIH0KPiA+ID4gPiA+IEBAIC0xMjc3LDcgKzEzMTMs
NiBAQCBzdGF0aWMgc3RydWN0IHNrX2J1ZmYgKnJlY2VpdmVfbWVyZ2VhYmxlKHN0cnVjdCBuZXRf
ZGV2aWNlICpkZXYsCj4gPiA+ID4gPiAgICAgICAgIGlmICh4ZHBfcHJvZykgewo+ID4gPiA+ID4g
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCB4ZHBfZnJhZ3NfdHJ1ZXN6ID0gMDsKPiA+ID4g
PiA+ICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc2tiX3NoYXJlZF9pbmZvICpzaGluZm87Cj4gPiA+
ID4gPiAtICAgICAgICAgICAgICAgc3RydWN0IHhkcF9mcmFtZSAqeGRwZjsKPiA+ID4gPiA+ICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgcGFnZSAqeGRwX3BhZ2U7Cj4gPiA+ID4gPiAgICAgICAgICAg
ICAgICAgc3RydWN0IHhkcF9idWZmIHhkcDsKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICB2b2lk
ICpkYXRhOwo+ID4gPiA+ID4gQEAgLTEyOTQsNDkgKzEzMjksMjIgQEAgc3RhdGljIHN0cnVjdCBz
a19idWZmICpyZWNlaXZlX21lcmdlYWJsZShzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAo+ID4gPiA+
ID4gICAgICAgICAgICAgICAgIGlmICh1bmxpa2VseShlcnIpKQo+ID4gPiA+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgZ290byBlcnJfeGRwX2ZyYWdzOwo+ID4gPiA+ID4KPiA+ID4gPiA+IC0g
ICAgICAgICAgICAgICBhY3QgPSBicGZfcHJvZ19ydW5feGRwKHhkcF9wcm9nLCAmeGRwKTsKPiA+
ID4gPiA+IC0gICAgICAgICAgICAgICBzdGF0cy0+eGRwX3BhY2tldHMrKzsKPiA+ID4gPiA+ICsg
ICAgICAgICAgICAgICBhY3QgPSB2aXJ0bmV0X3hkcF9oYW5kbGVyKHhkcF9wcm9nLCAmeGRwLCBk
ZXYsIHhkcF94bWl0LCBzdGF0cyk7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gICAgICAgICAgICAgICAg
IHN3aXRjaCAoYWN0KSB7Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgY2FzZSBYRFBfUEFTUzoK
PiA+ID4gPiA+ICsgICAgICAgICAgICAgICBjYXNlIFZJUlRORVRfWERQX1JFU19QQVNTOgo+ID4g
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaGVhZF9za2IgPSBidWlsZF9za2JfZnJvbV94
ZHBfYnVmZihkZXYsIHZpLCAmeGRwLCB4ZHBfZnJhZ3NfdHJ1ZXN6KTsKPiA+ID4gPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgIGlmICh1bmxpa2VseSghaGVhZF9za2IpKQo+ID4gPiA+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGVycl94ZHBfZnJhZ3M7Cj4gPiA+ID4g
Pgo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmN1X3JlYWRfdW5sb2NrKCk7Cj4g
PiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gaGVhZF9za2I7Cj4gPiA+ID4g
PiAtICAgICAgICAgICAgICAgY2FzZSBYRFBfVFg6Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICBzdGF0cy0+eGRwX3R4Kys7Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAg
ICB4ZHBmID0geGRwX2NvbnZlcnRfYnVmZl90b19mcmFtZSgmeGRwKTsKPiA+ID4gPiA+IC0gICAg
ICAgICAgICAgICAgICAgICAgIGlmICh1bmxpa2VseSgheGRwZikpIHsKPiA+ID4gPiA+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgbmV0ZGV2X2RiZyhkZXYsICJjb252ZXJ0IGJ1ZmYg
dG8gZnJhbWUgZmFpbGVkIGZvciB4ZHBcbiIpOwo+ID4gPiA+Cj4gPiA+ID4gTml0OiBUaGlzIGRl
YnVnIGlzIGxvc3QgYWZ0ZXIgdGhlIGNvbnZlcnNpb24uCj4gPiA+Cj4gPiA+IFdpbGwgZml4Lgo+
ID4gPgo+ID4gPiBUaGFua3MuCj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBUaGFua3MKPiA+ID4gPgo+
ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGVycl94ZHBfZnJh
Z3M7Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICB9Cj4gPiA+ID4gPiAtICAgICAg
ICAgICAgICAgICAgICAgICBlcnIgPSB2aXJ0bmV0X3hkcF94bWl0KGRldiwgMSwgJnhkcGYsIDAp
Owo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgaWYgKHVubGlrZWx5KCFlcnIpKSB7
Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHhkcF9yZXR1cm5fZnJh
bWVfcnhfbmFwaSh4ZHBmKTsKPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIH0gZWxz
ZSBpZiAodW5saWtlbHkoZXJyIDwgMCkpIHsKPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdHJhY2VfeGRwX2V4Y2VwdGlvbih2aS0+ZGV2LCB4ZHBfcHJvZywgYWN0KTsK
PiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnJfeGRwX2Zy
YWdzOwo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgfQo+ID4gPiA+ID4gLSAgICAg
ICAgICAgICAgICAgICAgICAgKnhkcF94bWl0IHw9IFZJUlRJT19YRFBfVFg7Cj4gPiA+ID4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICByY3VfcmVhZF91bmxvY2soKTsKPiA+ID4gPiA+IC0gICAg
ICAgICAgICAgICAgICAgICAgIGdvdG8geGRwX3htaXQ7Cj4gPiA+ID4gPiAtICAgICAgICAgICAg
ICAgY2FzZSBYRFBfUkVESVJFQ1Q6Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBz
dGF0cy0+eGRwX3JlZGlyZWN0cysrOwo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAg
ZXJyID0geGRwX2RvX3JlZGlyZWN0KGRldiwgJnhkcCwgeGRwX3Byb2cpOwo+ID4gPiA+ID4gLSAg
ICAgICAgICAgICAgICAgICAgICAgaWYgKGVycikKPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZ290byBlcnJfeGRwX2ZyYWdzOwo+ID4gPiA+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgKnhkcF94bWl0IHw9IFZJUlRJT19YRFBfUkVESVI7Cj4gPiA+ID4gPiArCj4g
PiA+ID4gPiArICAgICAgICAgICAgICAgY2FzZSBWSVJUTkVUX1hEUF9SRVNfQ09OU1VNRUQ6Cj4g
PiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICByY3VfcmVhZF91bmxvY2soKTsKPiA+ID4g
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8geGRwX3htaXQ7Cj4gPiA+ID4gPiAtICAg
ICAgICAgICAgICAgZGVmYXVsdDoKPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGJw
Zl93YXJuX2ludmFsaWRfeGRwX2FjdGlvbih2aS0+ZGV2LCB4ZHBfcHJvZywgYWN0KTsKPiA+ID4g
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGZhbGx0aHJvdWdoOwo+ID4gPiA+ID4gLSAgICAg
ICAgICAgICAgIGNhc2UgWERQX0FCT1JURUQ6Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICB0cmFjZV94ZHBfZXhjZXB0aW9uKHZpLT5kZXYsIHhkcF9wcm9nLCBhY3QpOwo+ID4gPiA+
ID4gLSAgICAgICAgICAgICAgICAgICAgICAgZmFsbHRocm91Z2g7Cj4gPiA+ID4gPiAtICAgICAg
ICAgICAgICAgY2FzZSBYRFBfRFJPUDoKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgICAgICAg
ICAgICBjYXNlIFZJUlRORVRfWERQX1JFU19EUk9QOgo+ID4gPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgZ290byBlcnJfeGRwX2ZyYWdzOwo+ID4gPiA+ID4gICAgICAgICAgICAgICAgIH0K
PiA+ID4gPiA+ICBlcnJfeGRwX2ZyYWdzOgo+ID4gPiA+ID4gLS0KPiA+ID4gPiA+IDIuMzIuMC4z
LmcwMTE5NWNmOWYKPiA+ID4gPiA+Cj4gPiA+ID4KPiA+ID4KPiA+Cj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
