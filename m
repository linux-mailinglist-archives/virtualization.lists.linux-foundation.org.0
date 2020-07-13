Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE9A21D1B8
	for <lists.virtualization@lfdr.de>; Mon, 13 Jul 2020 10:29:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3999B22817;
	Mon, 13 Jul 2020 08:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kWpcSjQA9bqR; Mon, 13 Jul 2020 08:29:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EC9AD2049D;
	Mon, 13 Jul 2020 08:29:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD3BCC0733;
	Mon, 13 Jul 2020 08:29:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0701C0733
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AB63F8844A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sGmCUkDtZ+qG
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:29:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F3CBE883F2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594628956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2EP1wYFVmWWtdehI67MqaS4RP11/+pSykSlwf0ANA6o=;
 b=KJpAO/M0aAgLoeL0qrNNP0lMtBGp66QcJRz3AcMo+qT+NGKfXvC0UdRPCYEZIjAW3iORl4
 +pyQvNj/QJtHCXFYsDy6wtRNs8mONIehHvUVRx7iSCMXB1i3yFEhy/tJfBk+d8tX+DfYjv
 07MT10c/AyiVLpOrkWvTFl+NITrSwi8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-4g4OQ4hlOxG33hYQB2ee9g-1; Mon, 13 Jul 2020 04:29:15 -0400
X-MC-Unique: 4g4OQ4hlOxG33hYQB2ee9g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDFF61080;
 Mon, 13 Jul 2020 08:29:13 +0000 (UTC)
Received: from [10.72.13.177] (ovpn-13-177.pek2.redhat.com [10.72.13.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F84C6FEF3;
 Mon, 13 Jul 2020 08:28:58 +0000 (UTC)
Subject: Re: [PATCH 5/7] virtio_vdpa: init IRQ offloading function pointers to
 NULL.
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com,
 alex.williamson@redhat.com, pbonzini@redhat.com,
 sean.j.christopherson@intel.com, wanpengli@tencent.com
References: <1594565366-3195-1-git-send-email-lingshan.zhu@intel.com>
 <1594565366-3195-5-git-send-email-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <276bf939-8e12-e28a-64f7-1767851e0db5@redhat.com>
Date: Mon, 13 Jul 2020 16:28:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594565366-3195-5-git-send-email-lingshan.zhu@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: netdev@vger.kernel.org, kvm@vger.kernel.org,
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

Ck9uIDIwMjAvNy8xMiDkuIvljYgxMDo0OSwgWmh1IExpbmdzaGFuIHdyb3RlOgo+IFRoaXMgY29t
bWl0IGluaXRpYWxpemUgSVJRIG9mZmxvYWRpbmcgZnVuY3Rpb24gcG9pbnRlcnMgaW4KPiB2aXJ0
aW9fdmRwYV9kcml2ZXIgdG8gTlVMTC4gQmVjYXN1ZSBpcnEgb2ZmbG9hZGluZyBvbmx5IGZvY3Vz
Cj4gb24gVk1zIGZvciB2aG9zdF92ZHBhLgo+Cj4gU2lnbmVkLW9mZi1ieTogWmh1IExpbmdzaGFu
IDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPgo+IC0tLQo+ICAgZHJpdmVycy92aXJ0aW8vdmlydGlv
X3ZkcGEuYyB8IDIgKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fdmRwYS5jIGIvZHJpdmVycy92aXJ0aW8v
dmlydGlvX3ZkcGEuYwo+IGluZGV4IGMzMGViNTUuLjFlOGFjYjkgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy92aXJ0aW8vdmlydGlvX3ZkcGEuYwo+ICsrKyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb192
ZHBhLmMKPiBAQCAtMzg2LDYgKzM4Niw4IEBAIHN0YXRpYyB2b2lkIHZpcnRpb192ZHBhX3JlbW92
ZShzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEpCj4gICAJfSwKPiAgIAkucHJvYmUJPSB2aXJ0aW9f
dmRwYV9wcm9iZSwKPiAgIAkucmVtb3ZlID0gdmlydGlvX3ZkcGFfcmVtb3ZlLAo+ICsJLnNldHVw
X3ZxX2lycSA9IE5VTEwsCj4gKwkudW5zZXR1cF92cV9pcnEgPSBOVUxMLAo+ICAgfTsKCgpJcyB0
aGlzIHJlYWxseSBuZWVkZWQgY29uc2lkZXIgdGhlIGl0J3Mgc3RhdGljPwoKVGhhbmtzCgoKPiAg
IAo+ICAgbW9kdWxlX3ZkcGFfZHJpdmVyKHZpcnRpb192ZHBhX2RyaXZlcik7CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWls
aW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRp
b24=
