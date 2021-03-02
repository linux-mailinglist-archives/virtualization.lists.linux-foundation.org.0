Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EED0329B1B
	for <lists.virtualization@lfdr.de>; Tue,  2 Mar 2021 11:52:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0188C6068B;
	Tue,  2 Mar 2021 10:52:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eI-7jmvgyPGp; Tue,  2 Mar 2021 10:52:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9C3360723;
	Tue,  2 Mar 2021 10:52:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 599DAC0001;
	Tue,  2 Mar 2021 10:52:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C1A6C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 10:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A764430D8
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 10:52:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eMif_MoFREUu
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 10:52:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A506D430BE
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 10:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614682356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nAqWjdxHKM9RMSGR9ESqFSYlgdQLhc7If8c/sW1Qwhg=;
 b=IzAc8dCjqhn/WbCKHsJ2rMzb2MJSekArMjjsgWyh89P72UNwObl3OcFR/Wz8UztkQlM45r
 oWyzUd7vGErDwSzcG1Xq3SMKAR5y7ZGnkd8+aA1KceiFNbZQ2Bfp0rsIvYDF3Esj3A2Was
 dgYS/xNYk4Sp2FJS8MEpC3vBf/aNcGw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-9W1T2-QTM_WUBQGZBTxv_g-1; Tue, 02 Mar 2021 05:52:34 -0500
X-MC-Unique: 9W1T2-QTM_WUBQGZBTxv_g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABED2107ACF9;
 Tue,  2 Mar 2021 10:52:33 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-124.pek2.redhat.com
 [10.72.13.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3F1260BFA;
 Tue,  2 Mar 2021 10:52:28 +0000 (UTC)
Subject: Re: [PATCH] vhost-vdpa: honor CAP_IPC_LOCK
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210302091418.7226-1-jasowang@redhat.com>
 <20210302044918-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4f3dcc1e-b95d-f17c-b371-52119d693d10@redhat.com>
Date: Tue, 2 Mar 2021 18:52:27 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210302044918-mutt-send-email-mst@kernel.org>
Content-Language: en-GB
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjEvMy8yIDU6NTEg5LiL5Y2ILCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VHVlLCBNYXIgMDIsIDIwMjEgYXQgMDQ6MTQ6MThBTSAtMDUwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gV2hlbiBDQVBfSVBDX0xPQ0sgaXMgc2V0IHdlIHNob3VsZCBub3QgY2hlY2sgbG9ja2VkIG1l
bW9yeSBhZ2FpbnN0Cj4+IHJsaW1pdCBhcyB3aGF0IGhhcyBiZWVuIGltcGxlbWVudGVkIGluIG1s
b2NrKCkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5j
b20+Cj4gSW5kZWVkIGFuZCBpdCdzIG5vdCBqdXN0IG1sb2NrLgo+Cj4gRG9jdW1lbnRhdGlvbi9h
ZG1pbi1ndWlkZS9wZXJmLXNlY3VyaXR5LnJzdDoKPgo+IFJMSU1JVF9NRU1MT0NLIGFuZCBwZXJm
X2V2ZW50X21sb2NrX2tiIHJlc291cmNlIGNvbnN0cmFpbnRzIGFyZSBpZ25vcmVkCj4gZm9yIHBy
b2Nlc3NlcyB3aXRoIHRoZSBDQVBfSVBDX0xPQ0sgY2FwYWJpbGl0eS4KPgo+IGFuZCBsZXQncyBh
ZGQgYSBGaXhlczogdGFnPwoKClN1cmUsIFYyIGlzIHBvc3RlZC4KClRoYW5rcwoKCj4KPj4gLS0t
Cj4+ICAgZHJpdmVycy92aG9zdC92ZHBhLmMgfCAzICsrLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dmhvc3QvdmRwYS5jIGIvZHJpdmVycy92aG9zdC92ZHBhLmMKPj4gaW5kZXggZWY2ODhjOGMwZTBl
Li5lOTM1NzJlMmUzNDQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvdmhvc3QvdmRwYS5jCj4+ICsr
KyBiL2RyaXZlcnMvdmhvc3QvdmRwYS5jCj4+IEBAIC02MzgsNyArNjM4LDggQEAgc3RhdGljIGlu
dCB2aG9zdF92ZHBhX3Byb2Nlc3NfaW90bGJfdXBkYXRlKHN0cnVjdCB2aG9zdF92ZHBhICp2LAo+
PiAgIAltbWFwX3JlYWRfbG9jayhkZXYtPm1tKTsKPj4gICAKPj4gICAJbG9ja19saW1pdCA9IHJs
aW1pdChSTElNSVRfTUVNTE9DSykgPj4gUEFHRV9TSElGVDsKPj4gLQlpZiAobnBhZ2VzICsgYXRv
bWljNjRfcmVhZCgmZGV2LT5tbS0+cGlubmVkX3ZtKSA+IGxvY2tfbGltaXQpIHsKPj4gKwlpZiAo
IWNhcGFibGUoQ0FQX0lQQ19MT0NLKSAmJgo+PiArCSAgICAobnBhZ2VzICsgYXRvbWljNjRfcmVh
ZCgmZGV2LT5tbS0+cGlubmVkX3ZtKSA+IGxvY2tfbGltaXQpKSB7Cj4+ICAgCQlyZXQgPSAtRU5P
TUVNOwo+PiAgIAkJZ290byB1bmxvY2s7Cj4+ICAgCX0KPj4gLS0gCj4+IDIuMTguMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24g
bWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxp
emF0aW9u
