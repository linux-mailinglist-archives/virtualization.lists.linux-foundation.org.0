Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC4DE6BA1
	for <lists.virtualization@lfdr.de>; Mon, 28 Oct 2019 04:52:20 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0FFF1907;
	Mon, 28 Oct 2019 03:52:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DDF8441C
	for <virtualization@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 03:52:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 4B78763D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 03:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572234732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=6E/VIYauZRkR+EOHGifF88F6ifejkfSEd/ycozu4oc0=;
	b=Lu3gtq98o55AAaBpAhXuvv3yho+UoByMn8psW6aYVNlLqkzKpcZrwF3Pq6T37yZoVsz/i9
	jNYW/wjFXCChcZSqRAxLzwvfZ2nTaXC/oH74LTmRARQimGr4bSHCOI+zu+vp1OgyBEz5lf
	Mky6fTV5FLksDTJq3C47KkLmkxsrGXA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-283-uGx5hqUSPcKVVpELU8IOMQ-1; Sun, 27 Oct 2019 23:52:08 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F0765EC;
	Mon, 28 Oct 2019 03:52:07 +0000 (UTC)
Received: from [10.72.12.246] (ovpn-12-246.pek2.redhat.com [10.72.12.246])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD96B6012C;
	Mon, 28 Oct 2019 03:52:02 +0000 (UTC)
Subject: Re: [PATCH net-next] vringh: fix copy direction of
	vringh_iov_push_kern()
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20191024035718.7690-1-jasowang@redhat.com>
	<20191027060328-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f8c51ab6-d328-b574-d5c4-ed4a8cd2c3ec@redhat.com>
Date: Mon, 28 Oct 2019 11:52:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191027060328-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: uGx5hqUSPcKVVpELU8IOMQ-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
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

Ck9uIDIwMTkvMTAvMjcg5LiL5Y2INjowNCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+IE9u
IFRodSwgT2N0IDI0LCAyMDE5IGF0IDExOjU3OjE4QU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6
Cj4+IFdlIHdhbnQgdG8gY29weSBmcm9tIGlvdiB0byBidWYsIHNvIHRoZSBkaXJlY3Rpb24gd2Fz
IHdyb25nLgo+Pgo+PiBOb3RlOiBubyByZWFsIHVzZXIgZm9yIHRoZSBoZWxwZXIsIGJ1dCBpdCB3
aWxsIGJlIHVzZWQgYnkgZnV0dXJlCj4+IGZlYXR1cmVzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBK
YXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+IEknbSBzdGlsbCBpbmNsaW5lZCB0byBt
ZXJnZSBpdCBub3csIGluY29ycmVjdCBjb2RlIHRlbmRzIHRvCj4gcHJvbGlmZXJhdGUuCgoKSSdt
IGZpbmUgd2l0aCB0aGlzLCBzbyBJIGJlbGlldmUgeW91IHdpbGwgbWVyZ2UgdGhpcyBwYXRjaD8K
ClRoYW5rcwoKCj4KPj4gLS0tCj4+ICAgZHJpdmVycy92aG9zdC92cmluZ2guYyB8IDggKysrKysr
Ky0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3ZyaW5naC5jIGIvZHJpdmVycy92aG9zdC92
cmluZ2guYwo+PiBpbmRleCAwOGFkMGQxZjA0NzYuLmEwYTJkNzQ5NjdlZiAxMDA2NDQKPj4gLS0t
IGEvZHJpdmVycy92aG9zdC92cmluZ2guYwo+PiArKysgYi9kcml2ZXJzL3Zob3N0L3ZyaW5naC5j
Cj4+IEBAIC04NTIsNiArODUyLDEyIEBAIHN0YXRpYyBpbmxpbmUgaW50IHhmZXJfa2Vybih2b2lk
ICpzcmMsIHZvaWQgKmRzdCwgc2l6ZV90IGxlbikKPj4gICAJcmV0dXJuIDA7Cj4+ICAgfQo+PiAg
IAo+PiArc3RhdGljIGlubGluZSBpbnQga2Vybl94ZmVyKHZvaWQgKmRzdCwgdm9pZCAqc3JjLCBz
aXplX3QgbGVuKQo+PiArewo+PiArCW1lbWNweShkc3QsIHNyYywgbGVuKTsKPj4gKwlyZXR1cm4g
MDsKPj4gK30KPj4gKwo+PiAgIC8qKgo+PiAgICAqIHZyaW5naF9pbml0X2tlcm4gLSBpbml0aWFs
aXplIGEgdnJpbmdoIGZvciBhIGtlcm5lbHNwYWNlIHZyaW5nLgo+PiAgICAqIEB2cmg6IHRoZSB2
cmluZ2ggdG8gaW5pdGlhbGl6ZS4KPj4gQEAgLTk1OCw3ICs5NjQsNyBAQCBFWFBPUlRfU1lNQk9M
KHZyaW5naF9pb3ZfcHVsbF9rZXJuKTsKPj4gICBzc2l6ZV90IHZyaW5naF9pb3ZfcHVzaF9rZXJu
KHN0cnVjdCB2cmluZ2hfa2lvdiAqd2lvdiwKPj4gICAJCQkgICAgIGNvbnN0IHZvaWQgKnNyYywg
c2l6ZV90IGxlbikKPj4gICB7Cj4+IC0JcmV0dXJuIHZyaW5naF9pb3ZfeGZlcih3aW92LCAodm9p
ZCAqKXNyYywgbGVuLCB4ZmVyX2tlcm4pOwo+PiArCXJldHVybiB2cmluZ2hfaW92X3hmZXIod2lv
diwgKHZvaWQgKilzcmMsIGxlbiwga2Vybl94ZmVyKTsKPj4gICB9Cj4+ICAgRVhQT1JUX1NZTUJP
TCh2cmluZ2hfaW92X3B1c2hfa2Vybik7Cj4+ICAgCj4+IC0tIAo+PiAyLjE5LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
