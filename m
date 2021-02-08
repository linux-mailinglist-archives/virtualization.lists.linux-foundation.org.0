Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FDC312A27
	for <lists.virtualization@lfdr.de>; Mon,  8 Feb 2021 06:42:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3C9CA86855;
	Mon,  8 Feb 2021 05:42:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2p8xvcry6Tvv; Mon,  8 Feb 2021 05:42:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6AEE4867FF;
	Mon,  8 Feb 2021 05:42:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42D8EC013A;
	Mon,  8 Feb 2021 05:42:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4712C013A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 05:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CA742203CF
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 05:42:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5cBd5i-J2WdH
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 05:42:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 6856A20356
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 05:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612762961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2rurmJQ4opTwfFXGQeyUIRfP+jPm6sD9BukDZ25cciA=;
 b=dnPf9UuvBiQ3KqrD7rk3Ph7yULz568Xqcdth6lQZoN1i5B7Blt7L68q+J3HeD/0E/JEkho
 d1J3V/EynM1SkyjfgOECguAzwZUW7Ihq+tPmwg9DUnmecgSeV2/HUidQBbMKqWlN1Ta+YF
 QpW4Z/qPLujimDJDSLG89/IjNLEnJl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-IDOr3tdoNKeQ4hMRY90kYw-1; Mon, 08 Feb 2021 00:42:37 -0500
X-MC-Unique: IDOr3tdoNKeQ4hMRY90kYw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10C68869ECC;
 Mon,  8 Feb 2021 05:42:36 +0000 (UTC)
Received: from [10.72.13.185] (ovpn-13-185.pek2.redhat.com [10.72.13.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E66DC5D9D5;
 Mon,  8 Feb 2021 05:42:28 +0000 (UTC)
Subject: Re: [PATCH V3 16/19] virtio-pci: introduce modern device module
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210104065503.199631-1-jasowang@redhat.com>
 <20210104065503.199631-17-jasowang@redhat.com>
 <20210205103214-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <24cb3ebe-1248-3e31-0716-cf498cf1d728@redhat.com>
Date: Mon, 8 Feb 2021 13:42:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210205103214-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: shahafs@mellanox.com, lulu@redhat.com, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjEvMi81IOS4i+WNiDExOjM0LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
TW9uLCBKYW4gMDQsIDIwMjEgYXQgMDI6NTU6MDBQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZzxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+IEkgZG9u
J3QgZXhhY3RseSBnZXQgd2h5IHdlIG5lZWQgdG8gc3BsaXQgdGhlIG1vZGVybiBkcml2ZXIgb3V0
LAo+IGFuZCBpdCBjYW4gY29uZnVzZSBwZW9wbGUgd2hvIGFyZSB1c2VkIHRvIGJlIHNlZWluZyB2
aXJ0aW8tcGNpLgoKClRoZSB2aXJ0aW8tcGNpIG1vZHVsZSBzdGlsbCB0aGVyZS4gTm8gdXNlciB2
aXNpYmxlIGNoYW5nZXMuIEp1c3Qgc29tZSAKY29kZXMgdGhhdCBjb3VsZCBiZSBzaGFyZWQgd2l0
aCBvdGhlciBkcml2ZXIgd2VyZSBzcGxpdCBvdXQuCgoKPgo+IFRoZSB2ZHBhIHRoaW5nIHNvIGZh
ciBsb29rcyBsaWtlIGEgZGV2ZWxvcG1lbnQgdG9vbCwgd2h5IGRvCj4gd2UgY2FyZSB0aGF0IGl0
IGRlcGVuZHMgb24gYSBiaXQgb2YgZXh0cmEgY29kZT8KCgpJZiBJJ20gbm90IG1pc3VuZGVyc3Rh
bmRpbmcsIHRyeWluZyB0byBzaGFyZSBjb2RlcyBpcyBwcm9wb3NlZCBieSB5b3UgaGVyZToKCmh0
dHBzOi8vbGttbC5vcmcvbGttbC8yMDIwLzYvMTAvMjMyCgpXZSBhbHNvIGhhZCB0aGUgcGxhbiB0
byBjb252ZXJ0IElGQ1ZGIHRvIHVzZSB0aGlzIGxpYnJhcnkuCgpUaGFua3MKCj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
