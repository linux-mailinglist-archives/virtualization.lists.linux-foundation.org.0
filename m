Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 45480E4ADE
	for <lists.virtualization@lfdr.de>; Fri, 25 Oct 2019 14:16:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0FD3DE38;
	Fri, 25 Oct 2019 12:16:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E227FF89
	for <virtualization@lists.linux-foundation.org>;
	Fri, 25 Oct 2019 12:16:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5B2BA89A
	for <virtualization@lists.linux-foundation.org>;
	Fri, 25 Oct 2019 12:16:35 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
	[209.85.160.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC1C53D94D
	for <virtualization@lists.linux-foundation.org>;
	Fri, 25 Oct 2019 12:16:34 +0000 (UTC)
Received: by mail-qt1-f200.google.com with SMTP id i25so1832399qtm.17
	for <virtualization@lists.linux-foundation.org>;
	Fri, 25 Oct 2019 05:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=lDtOQyoiNI8iBD+BJV41nuz3/0N81N8+l8LN/u4t5zU=;
	b=QM6rEU0r5ecT0FJENn+YNaeDgpK5Uy7Ki/0GFRN1kZTDlqWY1aOanyEtzgReUsTJMS
	rlBsFU7w//uAawiPYo+VQuhK58X7qWKZ6xdQrAZL4qH9EZ3x45t7HKGzNfCuv6d45Id/
	G/uCZs9/A4ug+Ov8ZWmAJq86wQL5cN9V6tMBk8/iXotd0+GWFLlfvs5Fg1FajAYE1EwD
	zfdzvr3Pq6S8r8i01N0Dt1seQioDf0KaU6qAS+4RsfEfjxUvFAdU3arzfsDxc+5/1Bg6
	JOuge+tdRVOwCvnC6MQtOonoVAtIlXoG5Y8fvXHC3/GmA/G0TgwWHpkccNu0x2nvOpig
	RELA==
X-Gm-Message-State: APjAAAXpsiEabqEQOpI56ibUJPIrqt2HUzMcfYNYH0TWlYfT+MfPNbht
	Pfp2NCIW6IrE7POHcUMR0rF4/beVb+xNita1iliLWV/a7X1K+xqKyQgX4oev0X6Lm+P4MtbTQDm
	q6yMCnvxyuQsqx86KqRlOHVfDntXp5oAyWTqcDC2eZw==
X-Received: by 2002:ac8:1109:: with SMTP id c9mr2661807qtj.10.1572005793998;
	Fri, 25 Oct 2019 05:16:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwK3+y0bW2iZzlHnWckL9qOZZ46Wovnc/341JCURY96Ut9tQ0zB6Sv5xfgv85VGvBF7MyqL9g==
X-Received: by 2002:ac8:1109:: with SMTP id c9mr2661774qtj.10.1572005793671;
	Fri, 25 Oct 2019 05:16:33 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	s21sm1555600qtc.12.2019.10.25.05.16.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 25 Oct 2019 05:16:32 -0700 (PDT)
Date: Fri, 25 Oct 2019 08:16:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v2] vhost: introduce mdev based hardware backend
Message-ID: <20191025080143-mutt-send-email-mst@kernel.org>
References: <20191023070747.GA30533@___>
	<106834b5-dae5-82b2-0f97-16951709d075@redhat.com>
	<20191023101135.GA6367@___>
	<5a7bc5da-d501-2750-90bf-545dd55f85fa@redhat.com>
	<20191024042155.GA21090@___>
	<d37529e1-5147-bbe5-cb9d-299bd6d4aa1a@redhat.com>
	<d4cc4f4e-2635-4041-2f68-cd043a97f25a@redhat.com>
	<20191024091839.GA17463@___>
	<fefc82a3-a137-bc03-e1c3-8de79b238080@redhat.com>
	<e7e239ba-2461-4f8d-7dd7-0f557ac7f4bf@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e7e239ba-2461-4f8d-7dd7-0f557ac7f4bf@redhat.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, zhihong.wang@intel.com,
	maxime.coquelin@redhat.com, virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org, lingshan.zhu@intel.com
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

T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMDU6NTQ6NTVQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzEwLzI0IOS4i+WNiDY6NDIsIEphc29uIFdhbmcgd3JvdGU6Cj4gPiAK
PiA+IFllcy4KPiA+IAo+ID4gCj4gPiA+IMKgIEFuZCB3ZSBzaG91bGQgdHJ5IHRvIGF2b2lkCj4g
PiA+IHB1dHRpbmcgY3RybCB2cSBhbmQgUngvVHggdnFzIGluIHRoZSBzYW1lIERNQSBzcGFjZSB0
byBwcmV2ZW50Cj4gPiA+IGd1ZXN0cyBoYXZpbmcgdGhlIGNoYW5jZSB0byBieXBhc3MgdGhlIGhv
c3QgKGUuZy4gUUVNVSkgdG8KPiA+ID4gc2V0dXAgdGhlIGJhY2tlbmQgYWNjZWxlcmF0b3IgZGly
ZWN0bHkuCj4gPiAKPiA+IAo+ID4gVGhhdCdzIHJlYWxseSBnb29kIHBvaW50LsKgIFNvIHdoZW4g
InZob3N0IiB0eXBlIGlzIGNyZWF0ZWQsIHBhcmVudAo+ID4gc2hvdWxkIGFzc3VtZSBhZGRyIG9m
IGN0cmxfdnEgaXMgaHZhLgo+ID4gCj4gPiBUaGFua3MKPiAKPiAKPiBUaGlzIHdvcmtzIGZvciB2
aG9zdCBidXQgbm90IHZpcnRpbyBzaW5jZSB0aGVyZSdzIG5vIHdheSBmb3IgdmlydGlvIGtlcm5l
bAo+IGRyaXZlciB0byBkaWZmZXIgY3RybF92cSB3aXRoIHRoZSByZXN0IHdoZW4gZG9pbmcgRE1B
IG1hcC4gT25lIHBvc3NpYmxlCj4gc29sdXRpb24gaXMgdG8gcHJvdmlkZSBETUEgZG9tYWluIGlz
b2xhdGlvbiBiZXR3ZWVuIHZpcnRxdWV1ZXMuIFRoZW4gY3RybCB2cQo+IGNhbiB1c2UgaXRzIGRl
ZGljYXRlZCBETUEgZG9tYWluIGZvciB0aGUgd29yay4KPiAKPiBBbnl3YXksIHRoaXMgY291bGQg
YmUgZG9uZSBpbiB0aGUgZnV0dXJlLiBXZSBjYW4gaGF2ZSBhIHZlcnNpb24gZmlyc3QgdGhhdAo+
IGRvZXNuJ3Qgc3VwcG9ydCBjdHJsX3ZxLgo+IAo+IFRoYW5rcwoKV2VsbCBubyBjdHJsX3ZxIGlt
cGxpZXMgZWl0aGVyIG5vIG9mZmxvYWRzLCBvciBubyBYRFAgKHNpbmNlIFhEUCBuZWVkcwp0byBk
aXNhYmxlIG9mZmxvYWRzIGR5bmFtaWNhbGx5KS4KCiAgICAgICAgaWYgKCF2aXJ0aW9faGFzX2Zl
YXR1cmUodmktPnZkZXYsIFZJUlRJT19ORVRfRl9DVFJMX0dVRVNUX09GRkxPQURTKQogICAgICAg
ICAgICAmJiAodmlydGlvX2hhc19mZWF0dXJlKHZpLT52ZGV2LCBWSVJUSU9fTkVUX0ZfR1VFU1Rf
VFNPNCkgfHwKICAgICAgICAgICAgICAgIHZpcnRpb19oYXNfZmVhdHVyZSh2aS0+dmRldiwgVklS
VElPX05FVF9GX0dVRVNUX1RTTzYpIHx8CiAgICAgICAgICAgICAgICB2aXJ0aW9faGFzX2ZlYXR1
cmUodmktPnZkZXYsIFZJUlRJT19ORVRfRl9HVUVTVF9FQ04pIHx8CiAgICAgICAgICAgICAgICB2
aXJ0aW9faGFzX2ZlYXR1cmUodmktPnZkZXYsIFZJUlRJT19ORVRfRl9HVUVTVF9VRk8pIHx8CiAg
ICAgICAgICAgICAgICB2aXJ0aW9faGFzX2ZlYXR1cmUodmktPnZkZXYsIFZJUlRJT19ORVRfRl9H
VUVTVF9DU1VNKSkpIHsKICAgICAgICAgICAgICAgIE5MX1NFVF9FUlJfTVNHX01PRChleHRhY2ss
ICJDYW4ndCBzZXQgWERQIHdoaWxlIGhvc3QgaXMgaW1wbGVtZW50aW5nIExSTy9DU1VNLCBkaXNh
YmxlIExSTy9DU1VNIGZpcnN0Iik7CiAgICAgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7
CiAgICAgICAgfQoKbmVpdGhlciBpcyB2ZXJ5IGF0dHJhY3RpdmUuCgpTbyB5ZXMgb2sganVzdCBm
b3IgZGV2ZWxvcG1lbnQgYnV0IHdlIGRvIG5lZWQgdG8gZmlndXJlIG91dCBob3cgaXQgd2lsbAp3
b3JrIGRvd24gdGhlIHJvYWQgaW4gcHJvZHVjdGlvbi4KClNvIHJlYWxseSB0aGlzIHNwZWNpZmlj
IHZpcnRpbyBuZXQgZGV2aWNlIGRvZXMgbm90IHN1cHBvcnQgY29udHJvbCB2cSwKaW5zdGVhZCBp
dCBzdXBwb3J0cyBhIGRpZmZlcmVudCB0cmFuc3BvcnQgc3BlY2lmaWMgd2F5IHRvIHNlbmQgY29t
bWFuZHMKdG8gZGV2aWNlLgoKU29tZSBraW5kIG9mIGV4dGVuc2lvbiB0byB0aGUgdHJhbnNwb3J0
PyBJZGVhcz8KCgotLSAKTVNUCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
