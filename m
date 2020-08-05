Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F5123C75C
	for <lists.virtualization@lfdr.de>; Wed,  5 Aug 2020 10:07:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 78DFC86591;
	Wed,  5 Aug 2020 08:07:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MvOvTZoBiYSj; Wed,  5 Aug 2020 08:07:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1807A8659F;
	Wed,  5 Aug 2020 08:07:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9E01C004C;
	Wed,  5 Aug 2020 08:07:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 099FCC004C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 08:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E50808776C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 08:07:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 24YmDbe7Et-J
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 08:07:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9F4B48770E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 08:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596614829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U+P5AqxVwLdPgRW/WZrpuWJB7Ff2u+rvbxrrV1P3Ilw=;
 b=cCNLnzQDPscHAf4NqaOq+XcXeXEylPuKh6G0m+6G60nomiH5NBWH+JcciQ12W8SfpQ+qoT
 VASDF9sKagapz1qSkkvlBPJosyOGC+7JKnauj7ediVcB5D1N1CJ25KTJxlSmzz8F1wnhyt
 1fpSh1cj7/iDBf85LIjo9zkCKhb/H6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-waLDMApFPg6rO-lpbdax3w-1; Wed, 05 Aug 2020 04:07:07 -0400
X-MC-Unique: waLDMApFPg6rO-lpbdax3w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB6D3100AA25;
 Wed,  5 Aug 2020 08:07:02 +0000 (UTC)
Received: from [10.72.12.225] (ovpn-12-225.pek2.redhat.com [10.72.12.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E196C19C4F;
 Wed,  5 Aug 2020 08:06:51 +0000 (UTC)
Subject: Re: [PATCH V5 4/6] vhost_vdpa: implement IRQ offloading in vhost_vdpa
To: Zhu Lingshan <lingshan.zhu@intel.com>, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, sean.j.christopherson@intel.com,
 wanpengli@tencent.com
References: <20200731065533.4144-1-lingshan.zhu@intel.com>
 <20200731065533.4144-5-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4c711720-b4ff-6f09-61cb-2d305daa69c8@redhat.com>
Date: Wed, 5 Aug 2020 16:06:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731065533.4144-5-lingshan.zhu@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: shahafs@mellanox.com, parav@mellanox.com, kvm@vger.kernel.org,
 netdev@vger.kernel.org, virtualization@lists.linux-foundation.org,
 eli@mellanox.com
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

Ck9uIDIwMjAvNy8zMSDkuIvljYgyOjU1LCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4gK3N0YXRpYyB2
b2lkIHZob3N0X3ZkcGFfc2V0dXBfdnFfaXJxKHN0cnVjdCB2aG9zdF92ZHBhICp2LCB1MTYgcWlk
KQo+ICt7Cj4gKwlzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSA9ICZ2LT52cXNbcWlkXTsKPiAr
CWNvbnN0IHN0cnVjdCB2ZHBhX2NvbmZpZ19vcHMgKm9wcyA9IHYtPnZkcGEtPmNvbmZpZzsKPiAr
CXN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYSA9IHYtPnZkcGE7Cj4gKwlpbnQgcmV0LCBpcnE7Cj4g
Kwo+ICsJc3Bpbl9sb2NrKCZ2cS0+Y2FsbF9jdHguY3R4X2xvY2spOwo+ICsJaXJxID0gb3BzLT5n
ZXRfdnFfaXJxKHZkcGEsIHFpZCk7CgoKQnR3LCB0aGlzIGFzc3VtZXMgdGhhdCBnZXRfdnFfaXJx
IGlzIG1hbmRhdG9yeS4gVGhpcyBsb29rcyB3cm9uZyBzaW5jZSAKdGhlcmUncyBubyBndWFyYW50
ZWUgdGhhdCB0aGUgdkRQQSBkZXZpY2UgZHJpdmVyIGNhbiBzZWUgaXJxLiBBbmQgdGhpcyAKYnJl
YWsgdmRwYSBzaW11bGF0b3IuCgpMZXQncyBhZGQgYSBjaGVjayBhbmQgbWFrZSBpdCBvcHRpb25h
bCBieSBkb2N1bWVudCB0aGlzIGFzc3VtcHRpb24gaW4gCnRoZSB2ZHBhLmguCgpUaGFua3MKCgo+
ICsJaWYgKCF2cS0+Y2FsbF9jdHguY3R4IHx8IGlycSA8IDApIHsKPiArCQlzcGluX3VubG9jaygm
dnEtPmNhbGxfY3R4LmN0eF9sb2NrKTsKPiArCQlyZXR1cm47Cj4gKwl9Cj4gKwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFp
bGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0
aW9u
