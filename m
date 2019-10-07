Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0A0CE625
	for <lists.virtualization@lfdr.de>; Mon,  7 Oct 2019 16:55:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CFA31E45;
	Mon,  7 Oct 2019 14:55:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3C8B2491
	for <virtualization@lists.linux-foundation.org>;
	Mon,  7 Oct 2019 14:55:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8BFA68B3
	for <virtualization@lists.linux-foundation.org>;
	Mon,  7 Oct 2019 14:55:20 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id r134so9470098lff.12
	for <virtualization@lists.linux-foundation.org>;
	Mon, 07 Oct 2019 07:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=oKQe8PW7xJsxkuN7cYHlHAyycnltqq5WzMyDlYxJAao=;
	b=KCbv97tb6Hoh+UXuWKIUqilZW7r/lPn2+CWJfseZOOnUoC8QIPALjQLyuNIqXZHsmh
	HwsTk9x4Sdbf/IKiQVm6WfCgWLrqpfn4ZR4CH9iFtso8DJD2+S/v7b3ZjiNWG/F5dkAW
	nRBoHuP/CK0mFGQ21n+aVegUI1Tse1t2q6Yf0qpKGgz45aMPJTtzqEvp4mYvfLTSwNSn
	j5kR90O4aCU1cJc5uICbDFGBJ6WvJGvFDkI4KDzgAyBgFvCrsyXiE0if7jUVgk2nzvT5
	f0sXT2AO6Gci1607rq7Q0NDDCvuHsVYtStfCc46EZzwD9EEatEgaxEe14LROGNNUMvug
	Z3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=oKQe8PW7xJsxkuN7cYHlHAyycnltqq5WzMyDlYxJAao=;
	b=MaoGPruBCD0+vtSOeQJnH2+k1Ei7l9PrNBBx/CNCcg/2U1yZhI/p6E5l2/Liocs8PY
	v6IyILwjWsO1ONFoJV3GQkgNGj2SsOZxmFrZHCy5BOnC9EI1hqC9eCragJuSW96bYXee
	/s6r2DY1N5RkvQVunGsifwrIZyMbXC2PtKjTnCN+B4W8eOzRecWPV82QoOUqBRWnHFs8
	hM4amJ162+qMd3CV44YO3Ty8ETBGz3GP6rnuoxqLzLTYATDcFFJQhUMX206NkyL7YLIa
	zZ4cL9FUQbNFxTy5b47rDtHDFthiIN9ZbIOfur452GERxQusX7RKqirsVpAbUbNXtmc5
	NUpw==
X-Gm-Message-State: APjAAAU9nKDfX1P0dyHNaGgevxXP8ySFagSKQvCVJHBkLDGuxLdJ8l8F
	NvdIDBC3aFT69S/nH+fsG0nCZP+lyH9Khrxjz+c=
X-Google-Smtp-Source: APXvYqxMeyuL3TPfkmpATSvEkF+Vpcsni2k5agi3aTnnPNW/tlMsFs2IEPjetUBcG/k204KKg7Mn9S20Ld9yM/f8ybA=
X-Received: by 2002:ac2:59c2:: with SMTP id x2mr15598267lfn.125.1570460118637; 
	Mon, 07 Oct 2019 07:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <20191006184515.23048-1-jcfaracco@gmail.com>
	<20191006184515.23048-2-jcfaracco@gmail.com>
	<52efa170-722c-334d-627e-30931fba7a7e@linux.ibm.com>
In-Reply-To: <52efa170-722c-334d-627e-30931fba7a7e@linux.ibm.com>
From: Julio Faracco <jcfaracco@gmail.com>
Date: Mon, 7 Oct 2019 11:55:06 -0300
Message-ID: <CAENf94JY_ScDs+hW9EMMmYamTQ8bkLfavYZJdgCmk-59N3dCtQ@mail.gmail.com>
Subject: Re: [PATCH RFC net-next 1/2] drivers: net: virtio_net: Add tx_timeout
	stats field
To: Julian Wiedmann <jwi@linux.ibm.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, DOS_RCVD_IP_TWICE_B, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Daiane Mendes <dnmendes76@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, davem@davemloft.net
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

RW0gc2VnLCA3IGRlIG91dCBkZSAyMDE5IMOgcyAxMToxNSwgSnVsaWFuIFdpZWRtYW5uIDxqd2lA
bGludXguaWJtLmNvbT4gZXNjcmV2ZXU6Cj4KPiBPbiAwNi4xMC4xOSAyMDo0NSwgamNmYXJhY2Nv
QGdtYWlsLmNvbSB3cm90ZToKPiA+IEZyb206IEp1bGlvIEZhcmFjY28gPGpjZmFyYWNjb0BnbWFp
bC5jb20+Cj4gPgo+ID4gRm9yIGRlYnVnIHB1cnBvc2Ugb2YgVFggdGltZW91dCBldmVudHMsIGEg
dHhfdGltZW91dCBlbnRyeSB3YXMgYWRkZWQgdG8KPiA+IG1vbml0b3IgdGhpcyBzcGVjaWFsIGNh
c2U6IHdoZW4gZGV2X3dhdGNoZG9nIGlkZW50aWZpZXMgYSB0eF90aW1lb3V0IGFuZAo+ID4gdGhy
b3cgYW4gZXhjZXB0aW9uLiBXZSBjYW4gYm90aCBjb25zaWRlciB0aGlzIGV2ZW50IGFzIGFuIGVy
cm9yLCBidXQKPiA+IGRyaXZlciBzaG91bGQgcmVwb3J0IGFzIGEgdHhfdGltZW91dCBzdGF0aXN0
aWMuCj4gPgo+Cj4gSGkgSnVsaW8sCj4gZGV2X3dhdGNoZG9nKCkgdXBkYXRlcyB0eHEtPnRyYW5z
X3RpbWVvdXQsIHdoeSBpc24ndCB0aGF0IHN1ZmZpY2llbnQ/CgpIaSBKdWxpYW4sCkdvb2QgY2F0
Y2ghIFRoaXMgY2FzZSAodGhpcyBwYXRjaCkgaXQgd291bGQgYmUgdXNlZnVsIG9ubHkgZm9yIGV0
aHRvb2wgc3RhdHMuClRoaXMgaXMgbm90IHNvIHJlbGV2YW50IGFzIHRoZSBtZXRob2QgaW1wbGVt
ZW50YXRpb24gaXRzZWxmLgpCdXQsIG9uIHRoZSBvdGhlciBoYW5kLCBJIHRoaW5rIGl0IHNob3Vs
ZCBiZSByZWxldmFudCBpZiB3ZSBzcGxpdCBpbnRvCnR4X3RpbWVvdXQgcGVyIHF1ZXVlLgpBbnl3
YXksIHN1Z2dlc3Rpb25zIGFyZSB3ZWxjb21lLgoKPgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKdWxp
byBGYXJhY2NvIDxqY2ZhcmFjY29AZ21haWwuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFpYW5l
IE1lbmRlcyA8ZG5tZW5kZXM3NkBnbWFpbC5jb20+Cj4gPiBDYzogSmFzb24gV2FuZyA8amFzb3dh
bmdAcmVkaGF0LmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYyB8IDYg
KysrKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC92aXJ0aW9fbmV0LmMgYi9kcml2ZXJz
L25ldC92aXJ0aW9fbmV0LmMKPiA+IGluZGV4IDRmM2RlMGFjOGIwYi4uMjdmOWIyMTJjOWY1IDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4gPiArKysgYi9kcml2ZXJz
L25ldC92aXJ0aW9fbmV0LmMKPiA+IEBAIC03NSw2ICs3NSw3IEBAIHN0cnVjdCB2aXJ0bmV0X3Nx
X3N0YXRzIHsKPiA+ICAgICAgIHU2NCB4ZHBfdHg7Cj4gPiAgICAgICB1NjQgeGRwX3R4X2Ryb3Bz
Owo+ID4gICAgICAgdTY0IGtpY2tzOwo+ID4gKyAgICAgdTY0IHR4X3RpbWVvdXRzOwo+ID4gIH07
Cj4gPgo+ID4gIHN0cnVjdCB2aXJ0bmV0X3JxX3N0YXRzIHsKPiA+IEBAIC05OCw2ICs5OSw3IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgdmlydG5ldF9zdGF0X2Rlc2MgdmlydG5ldF9zcV9zdGF0c19k
ZXNjW10gPSB7Cj4gPiAgICAgICB7ICJ4ZHBfdHgiLCAgICAgICAgICAgICBWSVJUTkVUX1NRX1NU
QVQoeGRwX3R4KSB9LAo+ID4gICAgICAgeyAieGRwX3R4X2Ryb3BzIiwgICAgICAgVklSVE5FVF9T
UV9TVEFUKHhkcF90eF9kcm9wcykgfSwKPiA+ICAgICAgIHsgImtpY2tzIiwgICAgICAgICAgICAg
IFZJUlRORVRfU1FfU1RBVChraWNrcykgfSwKPiA+ICsgICAgIHsgInR4X3RpbWVvdXRzIiwgICAg
ICAgIFZJUlRORVRfU1FfU1RBVCh0eF90aW1lb3V0cykgfSwKPiA+ICB9Owo+ID4KPiA+ICBzdGF0
aWMgY29uc3Qgc3RydWN0IHZpcnRuZXRfc3RhdF9kZXNjIHZpcnRuZXRfcnFfc3RhdHNfZGVzY1td
ID0gewo+ID4gQEAgLTE3MjEsNyArMTcyMyw3IEBAIHN0YXRpYyB2b2lkIHZpcnRuZXRfc3RhdHMo
c3RydWN0IG5ldF9kZXZpY2UgKmRldiwKPiA+ICAgICAgIGludCBpOwo+ID4KPiA+ICAgICAgIGZv
ciAoaSA9IDA7IGkgPCB2aS0+bWF4X3F1ZXVlX3BhaXJzOyBpKyspIHsKPiA+IC0gICAgICAgICAg
ICAgdTY0IHRwYWNrZXRzLCB0Ynl0ZXMsIHJwYWNrZXRzLCByYnl0ZXMsIHJkcm9wczsKPiA+ICsg
ICAgICAgICAgICAgdTY0IHRwYWNrZXRzLCB0Ynl0ZXMsIHRlcnJvcnMsIHJwYWNrZXRzLCByYnl0
ZXMsIHJkcm9wczsKPiA+ICAgICAgICAgICAgICAgc3RydWN0IHJlY2VpdmVfcXVldWUgKnJxID0g
JnZpLT5ycVtpXTsKPiA+ICAgICAgICAgICAgICAgc3RydWN0IHNlbmRfcXVldWUgKnNxID0gJnZp
LT5zcVtpXTsKPiA+Cj4gPiBAQCAtMTcyOSw2ICsxNzMxLDcgQEAgc3RhdGljIHZvaWQgdmlydG5l
dF9zdGF0cyhzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAo+ID4gICAgICAgICAgICAgICAgICAgICAg
IHN0YXJ0ID0gdTY0X3N0YXRzX2ZldGNoX2JlZ2luX2lycSgmc3EtPnN0YXRzLnN5bmNwKTsKPiA+
ICAgICAgICAgICAgICAgICAgICAgICB0cGFja2V0cyA9IHNxLT5zdGF0cy5wYWNrZXRzOwo+ID4g
ICAgICAgICAgICAgICAgICAgICAgIHRieXRlcyAgID0gc3EtPnN0YXRzLmJ5dGVzOwo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIHRlcnJvcnMgID0gc3EtPnN0YXRzLnR4X3RpbWVvdXRzOwo+ID4g
ICAgICAgICAgICAgICB9IHdoaWxlICh1NjRfc3RhdHNfZmV0Y2hfcmV0cnlfaXJxKCZzcS0+c3Rh
dHMuc3luY3AsIHN0YXJ0KSk7Cj4gPgo+ID4gICAgICAgICAgICAgICBkbyB7Cj4gPiBAQCAtMTc0
Myw2ICsxNzQ2LDcgQEAgc3RhdGljIHZvaWQgdmlydG5ldF9zdGF0cyhzdHJ1Y3QgbmV0X2Rldmlj
ZSAqZGV2LAo+ID4gICAgICAgICAgICAgICB0b3QtPnJ4X2J5dGVzICAgKz0gcmJ5dGVzOwo+ID4g
ICAgICAgICAgICAgICB0b3QtPnR4X2J5dGVzICAgKz0gdGJ5dGVzOwo+ID4gICAgICAgICAgICAg
ICB0b3QtPnJ4X2Ryb3BwZWQgKz0gcmRyb3BzOwo+ID4gKyAgICAgICAgICAgICB0b3QtPnR4X2Vy
cm9ycyAgKz0gdGVycm9yczsKPiA+ICAgICAgIH0KPiA+Cj4gPiAgICAgICB0b3QtPnR4X2Ryb3Bw
ZWQgPSBkZXYtPnN0YXRzLnR4X2Ryb3BwZWQ7Cj4gPgo+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0
dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
