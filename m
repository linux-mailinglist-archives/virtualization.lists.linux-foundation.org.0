Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0CAE1819
	for <lists.virtualization@lfdr.de>; Wed, 23 Oct 2019 12:36:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BCE9CEC6;
	Wed, 23 Oct 2019 10:36:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 99C42EBD
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 10:36:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com
	(us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 2816614D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 10:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571827001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=c+ZJZ8Qp2Al2NCTrYo8r6xsLIqLGBhiVQkAHuY0n6VM=;
	b=Nm9AVlgbEcmIT3jgILXfOG6VZ4eryS4KBt6w8wvz265wEm/RnA/DmCm+c11jD5MKro/2Wx
	VVPTz/USMEx1gJBwZUF8oixHJK9/BYDhA8R0YlWZ8z3lEkuPdoQjyzZTICaNf8S8F2eKnf
	FDoeOlXFej+920PH7M2hC4UYmxnio5c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-330-ijQT5u_SMP-UphaCbNmtAA-1; Wed, 23 Oct 2019 06:36:37 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63DF21800D6B;
	Wed, 23 Oct 2019 10:36:35 +0000 (UTC)
Received: from [10.72.12.79] (ovpn-12-79.pek2.redhat.com [10.72.12.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3ECF05D6C8;
	Wed, 23 Oct 2019 10:36:24 +0000 (UTC)
Subject: Re: [RFC 1/2] vhost: IFC VF hardware operation layer
To: Simon Horman <simon.horman@netronome.com>
References: <20191016011041.3441-1-lingshan.zhu@intel.com>
	<20191016011041.3441-2-lingshan.zhu@intel.com>
	<20191016095347.5sb43knc7eq44ivo@netronome.com>
	<075be045-3a02-e7d8-672f-4a207c410ee8@intel.com>
	<20191021163139.GC4486@netronome.com>
	<15d94e61-9b3d-7854-b65e-6fea6db75450@redhat.com>
	<20191023101329.GE8732@netronome.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <83356b5f-e2f4-ab79-79d7-20d4850c26a9@redhat.com>
Date: Wed, 23 Oct 2019 18:36:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191023101329.GE8732@netronome.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: ijQT5u_SMP-UphaCbNmtAA-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, zhiyuan.lv@intel.com,
	jason.zeng@intel.com, "Zhu, Lingshan" <lingshan.zhu@intel.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvMTAvMjMg5LiL5Y2INjoxMywgU2ltb24gSG9ybWFuIHdyb3RlOgo+IE9uIFR1ZSwg
T2N0IDIyLCAyMDE5IGF0IDA5OjMyOjM2QU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+IE9u
IDIwMTkvMTAvMjIg5LiK5Y2IMTI6MzEsIFNpbW9uIEhvcm1hbiB3cm90ZToKPj4+IE9uIE1vbiwg
T2N0IDIxLCAyMDE5IGF0IDA1OjU1OjMzUE0gKzA4MDAsIFpodSwgTGluZ3NoYW4gd3JvdGU6Cj4+
Pj4gT24gMTAvMTYvMjAxOSA1OjUzIFBNLCBTaW1vbiBIb3JtYW4gd3JvdGU6Cj4+Pj4+IEhpIFpo
dSwKPj4+Pj4KPj4+Pj4gdGhhbmtzIGZvciB5b3VyIHBhdGNoLgo+Pj4+Pgo+Pj4+PiBPbiBXZWQs
IE9jdCAxNiwgMjAxOSBhdCAwOToxMDo0MEFNICswODAwLCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4+
PiAuLi4KPj4+Cj4+Pj4+PiArc3RhdGljIHZvaWQgaWZjdmZfcmVhZF9kZXZfY29uZmlnKHN0cnVj
dCBpZmN2Zl9odyAqaHcsIHU2NCBvZmZzZXQsCj4+Pj4+PiArCQkgICAgICAgdm9pZCAqZHN0LCBp
bnQgbGVuZ3RoKQo+Pj4+Pj4gK3sKPj4+Pj4+ICsJaW50IGk7Cj4+Pj4+PiArCXU4ICpwOwo+Pj4+
Pj4gKwl1OCBvbGRfZ2VuLCBuZXdfZ2VuOwo+Pj4+Pj4gKwo+Pj4+Pj4gKwlkbyB7Cj4+Pj4+PiAr
CQlvbGRfZ2VuID0gaW9yZWFkOCgmaHctPmNvbW1vbl9jZmctPmNvbmZpZ19nZW5lcmF0aW9uKTsK
Pj4+Pj4+ICsKPj4+Pj4+ICsJCXAgPSBkc3Q7Cj4+Pj4+PiArCQlmb3IgKGkgPSAwOyBpIDwgbGVu
Z3RoOyBpKyspCj4+Pj4+PiArCQkJKnArKyA9IGlvcmVhZDgoKHU4ICopaHctPmRldl9jZmcgKyBv
ZmZzZXQgKyBpKTsKPj4+Pj4+ICsKPj4+Pj4+ICsJCW5ld19nZW4gPSBpb3JlYWQ4KCZody0+Y29t
bW9uX2NmZy0+Y29uZmlnX2dlbmVyYXRpb24pOwo+Pj4+Pj4gKwl9IHdoaWxlIChvbGRfZ2VuICE9
IG5ld19nZW4pOwo+Pj4+PiBXb3VsZCBpdCBiZSB3aXNlIHRvIGxpbWl0IHRoZSBudW1iZXIgb2Yg
aXRlcmF0aW9ucyBvZiB0aGUgbG9vcCBhYm92ZT8KPj4+PiBUaGFua3MgYnV0IEkgZG9uJ3QgcXVp
dGUgZ2V0IGl0LiBUaGlzIGlzIHVzZWQgdG8gbWFrZSBzdXJlIHRoZSBmdW5jdGlvbgo+Pj4+IHdv
dWxkIGdldCB0aGUgbGF0ZXN0IGNvbmZpZy4KPj4+IEkgYW0gd29ycmllZCBhYm91dCB0aGUgcG9z
c2liaWxpdHkgdGhhdCBpdCB3aWxsIGxvb3AgZm9yZXZlci4KPj4+IENvdWxkIHRoYXQgaGFwcGVu
Pwo+Pj4KPj4+IC4uLgo+PiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgdGhlIGZ1bmN0aW9uIGhl
cmUgaXMgc2ltaWxhciB0byB2aXJ0aW8gY29uZmlnCj4+IGdlbmVyYXRpb24gWzFdLiBTbyB0aGlz
IGNhbiBvbmx5IGhhcHBlbiBmb3IgYSBidWdneSBoYXJkd2FyZS4KPiBPaywgc28gdGhpcyBjaXJj
bGVzIGJhY2sgdG8gbXkgb3JpZ2luYWwgcXVlc3Rpb24uCj4gU2hvdWxkIHdlIHB1dCBhIGJvdW5k
IG9uIHRoZSBudW1iZXIgb2YgdGltZXMgdGhlIGxvb3AgcnVucwo+IG9yIHNob3VsZCB3ZSBhY2Nl
cHQgdGhhdCB0aGUga2VybmVsIGxvY2tzIHVwIGlmIHRoZSBIVyBpcyBidWdneT8KPgoKSSdtIG5v
dCBzdXJlLCBhbmQgc2ltaWxhciBsb2dpYyBoYXMgYmVlbiB1c2VkIGJ5IHZpcnRpby1wY2kgZHJp
dmVycyBmb3IgCnllYXJzLiBDb25zaWRlciB0aGlzIGxvZ2ljIGlzIHByZXR0eSBzaW1wbGUgYW5k
IGl0IHNob3VsZCBub3QgYmUgdGhlIApvbmx5IHBsYWNlIHRoYXQgdmlyaXRvIGhhcmR3YXJlIGNh
biBsb2NrIGtlcm5lbCwgd2UgY2FuIGtlZXAgaXQgYXMgaXMuCgpBY3R1YWxseSwgdGhlcmUncyBu
byBuZWVkIGZvciBoYXJkd2FyZSB0byBpbXBsZW1lbnQgZ2VuZXJhdGlvbiBsb2dpYywgaXQgCmNv
dWxkIGJlIGVtdWxhdGVkIGJ5IHNvZnR3YXJlIG9yIGV2ZW4gaWdub3JlZC4gSW4gbmV3IHZlcnNp
b24gb2YgCnZpcnRpby1tZGV2LCBnZXRfZ2VuZXJhdGlvbigpIGlzIG9wdGlvbmFsLCB3aGVuIGl0
IHdhcyBub3QgaW1wbGVtZW50ZWQsIAowIGlzIHNpbXBseSByZXR1cm5lZCBieSB2aXJ0aW8tbWRl
diB0cmFuc3BvcnQuCgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBs
aXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
