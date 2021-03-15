Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB0633AD70
	for <lists.virtualization@lfdr.de>; Mon, 15 Mar 2021 09:31:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43BE5605BA;
	Mon, 15 Mar 2021 08:31:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S8eAKoEBXJUG; Mon, 15 Mar 2021 08:31:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 299E6606FD;
	Mon, 15 Mar 2021 08:31:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AFAEAC0012;
	Mon, 15 Mar 2021 08:31:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C892C0001
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 08:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41DF2606FD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 08:31:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3igEu3nGPYVr
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 08:31:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95932605BA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 08:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615797084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZKg5OJ0Wle9GUUJPspxr/sYEl3Le9qh1nxrGMT+1Rf8=;
 b=APt0FYtDH2Y2SXzyABS/0QaP2VfRoF94ExPy/fwFO1GNklsxcpKFtrgbUlBfFzbOVEARrZ
 i9r4k3TDBg6k3zwYUnJUoXwsLNeWHwDVVOd0BNHUXqzhbQ/Di+8+51OWF90B0JcI4DpGfc
 aCQSxGJXztJQtWNho2Lk3GqbsQpNefo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-aFVIdB69NjiChjbvg0Tg4g-1; Mon, 15 Mar 2021 04:31:20 -0400
X-MC-Unique: aFVIdB69NjiChjbvg0Tg4g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79845100C665;
 Mon, 15 Mar 2021 08:31:19 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-245.pek2.redhat.com
 [10.72.12.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77A355D745;
 Mon, 15 Mar 2021 08:31:13 +0000 (UTC)
Subject: Re: [PATCH] vhost: Fix vhost_vq_reset()
To: Laurent Vivier <lvivier@redhat.com>, linux-kernel@vger.kernel.org
References: <20210312140913.788592-1-lvivier@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <7bb4ee1a-d204-eb94-792f-ca250dacacea@redhat.com>
Date: Mon, 15 Mar 2021 16:31:11 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210312140913.788592-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: netdev@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CtTaIDIwMjEvMy8xMiDPws7nMTA6MDksIExhdXJlbnQgVml2aWVyINC0tcA6Cj4gdmhvc3RfcmVz
ZXRfaXNfbGUoKSBpcyB2aG9zdF9pbml0X2lzX2xlKCksIGFuZCBpbiB0aGUgY2FzZSBvZgo+IGNy
b3NzLWVuZGlhbiBsZWdhY3ksIHZob3N0X2luaXRfaXNfbGUoKSBkZXBlbmRzIG9uIHZxLT51c2Vy
X2JlLgo+Cj4gdnEtPnVzZXJfYmUgaXMgc2V0IGJ5IHZob3N0X2Rpc2FibGVfY3Jvc3NfZW5kaWFu
KCkuCj4KPiBCdXQgaW4gdmhvc3RfdnFfcmVzZXQoKSwgd2UgaGF2ZToKPgo+ICAgICAgdmhvc3Rf
cmVzZXRfaXNfbGUodnEpOwo+ICAgICAgdmhvc3RfZGlzYWJsZV9jcm9zc19lbmRpYW4odnEpOwo+
Cj4gQW5kIHNvIHVzZXJfYmUgaXMgdXNlZCBiZWZvcmUgYmVpbmcgc2V0Lgo+Cj4gVG8gZml4IHRo
YXQsIHJldmVyc2UgdGhlIGxpbmVzIG9yZGVyIGFzIHRoZXJlIGlzIG5vIG90aGVyIGRlcGVuZGVu
Y3kKPiBiZXR3ZWVuIHRoZW0uCj4KPiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFZpdmllciA8bHZp
dmllckByZWRoYXQuY29tPgoKCkFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQu
Y29tPgoKCj4gLS0tCj4gICBkcml2ZXJzL3Zob3N0L3Zob3N0LmMgfCAyICstCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3Zob3N0L3Zob3N0LmMgYi9kcml2ZXJzL3Zob3N0L3Zob3N0LmMKPiBpbmRleCBhMjYy
ZTEyYzZkYzIuLjVjY2IwNzA1YmVhZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Zob3N0L3Zob3N0
LmMKPiArKysgYi9kcml2ZXJzL3Zob3N0L3Zob3N0LmMKPiBAQCAtMzMyLDggKzMzMiw4IEBAIHN0
YXRpYyB2b2lkIHZob3N0X3ZxX3Jlc2V0KHN0cnVjdCB2aG9zdF9kZXYgKmRldiwKPiAgIAl2cS0+
ZXJyb3JfY3R4ID0gTlVMTDsKPiAgIAl2cS0+a2ljayA9IE5VTEw7Cj4gICAJdnEtPmxvZ19jdHgg
PSBOVUxMOwo+IC0Jdmhvc3RfcmVzZXRfaXNfbGUodnEpOwo+ICAgCXZob3N0X2Rpc2FibGVfY3Jv
c3NfZW5kaWFuKHZxKTsKPiArCXZob3N0X3Jlc2V0X2lzX2xlKHZxKTsKPiAgIAl2cS0+YnVzeWxv
b3BfdGltZW91dCA9IDA7Cj4gICAJdnEtPnVtZW0gPSBOVUxMOwo+ICAgCXZxLT5pb3RsYiA9IE5V
TEw7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0
dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vdmlydHVhbGl6YXRpb24=
