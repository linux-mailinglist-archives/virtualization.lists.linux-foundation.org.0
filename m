Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 18120CE46F
	for <lists.virtualization@lfdr.de>; Mon,  7 Oct 2019 15:58:49 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 47659E48;
	Mon,  7 Oct 2019 13:58:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 52F5C2F
	for <virtualization@lists.linux-foundation.org>;
	Mon,  7 Oct 2019 13:58:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A384DD0
	for <virtualization@lists.linux-foundation.org>;
	Mon,  7 Oct 2019 13:58:40 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id y127so9382711lfc.0
	for <virtualization@lists.linux-foundation.org>;
	Mon, 07 Oct 2019 06:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=rS7GIQjyGvU27vvtTIu1FL1u2XlMjMyFmCXQWbGWBVg=;
	b=NENydgIQlpvB6RuFC5ovZYnM4dtqQuYQYexwXF3dPSTZW3I+95T3AIjzPUDduM3Ba3
	p7CtJmuY3uyQKp2lyiGFqlHKSBmmQoVz/Oyz6wwre0MyqFbSURtN2+h9jicVT/HkHYs8
	NwzkvULuYqam67gC8tsDQfm67MvjzLNCLvIO5MNURthoW725RXJ3Sv+wNTzYHHhTmJ0E
	N/YM3ExlQ7YqSJsDkPSzBti6uQuu3eZyyHji1CJ6iJvsI65gilg3yOAZSOLrMsekhHsa
	U+BBKQLhFbJxePOIpvaPWk8lPymFFuduc0ul7qk4wLVv0zB4hLjTOtwOOKVy11sQeNY7
	Lmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=rS7GIQjyGvU27vvtTIu1FL1u2XlMjMyFmCXQWbGWBVg=;
	b=awDWy3N2QPXf0LfaC7Hkj65H/sz71eCj3R4oKtNUnBsX8wKmN0NSud59SBBkH+2ISS
	tihkZJ2PlPKZdGqxJg8I4OyGKArpM5ZkliC76X6DOilZcMGCtUYHkeEhnMaQ65mkd9Cw
	a0xMy1sc2ZYOq17BkFvbP305Q9aCxoOkiDeWWPa10nXpen0S1S4SyjsWuKmzNveqydr8
	slxFhplfZMByYOTWiKzjV1K/G1FLsGhr0IEv1nMHiwqN2OR4ptvhmsWN+W7kbuTldI/g
	DjhC+/zcnwWcjFBuQI/1cn/prOEo4vyv6qVjqkuw8ApBTF5N/0gi3SPOE33SLOqtYBlY
	fdLA==
X-Gm-Message-State: APjAAAVtG0DSSe5532EG5BM+HX635szEgX9XLVsVlXX+VFgxTYSaHf/K
	WWu+REpFohmh8DLz51OGE8KNHwAtjYDrgvkR580=
X-Google-Smtp-Source: APXvYqzFIdc+285g5LfTP5zuKMDbwk+7sH1aRaSjQVKC1b77Y+7RLc9W7rTJb0+ANcjYQFVVHpKxrnvXygWfFaP5DrE=
X-Received: by 2002:a19:ca07:: with SMTP id a7mr18279722lfg.181.1570456718836; 
	Mon, 07 Oct 2019 06:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20191006184515.23048-1-jcfaracco@gmail.com>
	<20191007034208-mutt-send-email-mst@kernel.org>
In-Reply-To: <20191007034208-mutt-send-email-mst@kernel.org>
From: Julio Faracco <jcfaracco@gmail.com>
Date: Mon, 7 Oct 2019 10:58:27 -0300
Message-ID: <CAENf94Ky4Hrf+CyCTcKE8KXuVPECHc01OKRpKHGgykfeLe-jEg@mail.gmail.com>
Subject: Re: [PATCH RFC net-next 0/2] drivers: net: virtio_net: Implement
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, DOS_RCVD_IP_TWICE_B, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Daiane Mendes <dnmendes76@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
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

RW0gc2VnLCA3IGRlIG91dCBkZSAyMDE5IMOgcyAwNDo0MywgTWljaGFlbCBTLiBUc2lya2luIDxt
c3RAcmVkaGF0LmNvbT4gZXNjcmV2ZXU6Cj4KPiBPbiBTdW4sIE9jdCAwNiwgMjAxOSBhdCAwMzo0
NToxM1BNIC0wMzAwLCBqY2ZhcmFjY29AZ21haWwuY29tIHdyb3RlOgo+ID4gRnJvbTogSnVsaW8g
RmFyYWNjbyA8amNmYXJhY2NvQGdtYWlsLmNvbT4KPiA+Cj4gPiBEcml2ZXIgdmlydGlvX25ldCBp
cyBub3QgaGFuZGxpbmcgZXJyb3IgZXZlbnRzIGZvciBUWCBwcm92aWRlZCBieQo+ID4gZGV2X3dh
dGNoZG9nLiBUaGlzIGV2ZW50IGlzIHJlYWNoZWQgd2hlbiB0cmFuc21pc3Npb24gcXVldWUgaXMg
aGF2aW5nCj4gPiBwcm9ibGVtcyB0byB0cmFuc21pdCBwYWNrZXRzLiBUbyBlbmFibGUgaXQsIGRy
aXZlciBzaG91bGQgaGF2ZQo+ID4gLm5kb190eF90aW1lb3V0IGltcGxlbWVudGVkLiBUaGlzIHNl
cmllIGhhcyB0d28gY29tbWl0czoKPiA+Cj4gPiBJbiB0aGUgcGFzdCwgd2UgaW1wbGVtZW50ZWQg
YSBmdW5jdGlvbiB0byByZWNvdmVyIGRyaXZlciBzdGF0ZSB3aGVuIHRoaXMKPiA+IGtpbmQgb2Yg
ZXZlbnQgaGFwcGVucywgYnV0IHRoZSBzdHJ1Y3R1cmUgd2FzIHRvIGNvbXBsZXggZm9yIHZpcnRp
b19uZXQKPiA+IHRoYXQgbW9tZW50Lgo+Cj4gSXQncyBtb3JlIHRoYXQgaXQgd2FzIG1pc3Npbmcg
YSBidW5jaCBvZiBsb2Nrcy4KCkFjdHVhbGx5LCB3ZSBzdWJtaXR0ZWQgdGhpcyBwYXRjaCBhcyBh
IFJGQyB0byB1bmRlcnN0YW5kIHRoZSBjb21tdW5pdHkKcGVyc3BlY3RpdmUgYWJvdXQgdGhpcyBt
aXNzaW5nIGZlYXR1cmU6CkNvbXBsZXhpdHkgdmVyc3VzIHBlcmZvcm1hbmNlIHZlcnN1cyBzb2x1
dGlvbi4KCj4KPiA+IEFsdGVybmF0aXZlbGx5LCB0aGlzIHNrZWxldG9uIHNob3VsZCBiZSBlbm91
Z2ggZm9yIG5vdy4KPiA+Cj4gPiBGb3IgZnVydGhlciBkZXRhaWxzLCBzZWUgdGhyZWFkOgo+ID4g
aHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTUvNi8yMy82OTEKPiA+Cj4gPiBQYXRjaCAxLzI6Cj4g
PiAgIEFkZCBzdGF0aXN0aWMgZmllbGQgZm9yIFRYIHRpbWVvdXQgZXZlbnRzLgo+ID4KPiA+IFBh
dGNoIDIvMjoKPiA+ICAgSW1wbGVtZW50IGEgc2tlbGV0b24gZnVuY3Rpb24gdG8gZGVidWcgVFgg
dGltZW91dCBldmVudHMuCj4gPgo+ID4gSnVsaW8gRmFyYWNjbyAoMik6Cj4gPiAgIGRyaXZlcnM6
IG5ldDogdmlydGlvX25ldDogQWRkIHR4X3RpbWVvdXQgc3RhdHMgZmllbGQKPiA+ICAgZHJpdmVy
czogbmV0OiB2aXJ0aW9fbmV0OiBBZGQgdHhfdGltZW91dCBmdW5jdGlvbgo+ID4KPiA+ICBkcml2
ZXJzL25ldC92aXJ0aW9fbmV0LmMgfCAzMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
ID4KPiA+IC0tCj4gPiAyLjIxLjAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
