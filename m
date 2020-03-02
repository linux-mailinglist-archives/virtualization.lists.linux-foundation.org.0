Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5723B1752B4
	for <lists.virtualization@lfdr.de>; Mon,  2 Mar 2020 05:31:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DED1A85CA1;
	Mon,  2 Mar 2020 04:31:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2gDbwCCcdWPV; Mon,  2 Mar 2020 04:31:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1FB7B85C92;
	Mon,  2 Mar 2020 04:31:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 006F1C013E;
	Mon,  2 Mar 2020 04:31:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65557C013E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 04:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4C3B485633
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 04:31:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3AGh5MGHP3ly
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 04:31:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7880185631
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 04:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583123502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QOMQ5ASXj6ruD2o2CVhyt5419oX3mFIKgmuBXuhfitE=;
 b=G97pH1vVsR+DsHX8PGmAzeiEDdvGQdNCkN2tEa+RDkMzCnoDXKILAbse0AZV0KqGacZoJx
 3mQQ8Xc1YNhy0hlFpX+GIuoL414oFoy6jTCNgqw97ghkkX897t4WevqYgFIBGGYnz2BTeJ
 2ytcJstJ6pe+XMoaoAT7YEvt3Di7i1c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-0jVEAForNo-OwsYwTRmq5g-1; Sun, 01 Mar 2020 23:31:40 -0500
X-MC-Unique: 0jVEAForNo-OwsYwTRmq5g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03811107ACC4;
 Mon,  2 Mar 2020 04:31:39 +0000 (UTC)
Received: from [10.72.13.131] (ovpn-13-131.pek2.redhat.com [10.72.13.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECEE127183;
 Mon,  2 Mar 2020 04:31:30 +0000 (UTC)
Subject: Re: [PATCH v3 0/3] virtio-net: introduce features defined in the spec
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20200301143302.8556-1-yuri.benditovich@daynix.com>
 <20200301150625-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <70ddcfd3-c388-1d5d-0728-4dbb434c619c@redhat.com>
Date: Mon, 2 Mar 2020 12:31:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200301150625-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: yan@daynix.com, virtio-dev@lists.oasis-open.org,
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

Ck9uIDIwMjAvMy8yIOS4iuWNiDQ6MDYsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBT
dW4sIE1hciAwMSwgMjAyMCBhdCAwNDozMjo1OVBNICswMjAwLCBZdXJpIEJlbmRpdG92aWNoIHdy
b3RlOgo+PiBUaGlzIHNlcmllcyBpbnRyb2R1Y2UgdmlydGlvLW5ldCBmZWF0dXJlcyBWSVJUSU9f
TkVUX0ZfUlNDX0VYVCwKPj4gVklSVElPX05FVF9GX1JTUyBhbmQgVklSVElPX05FVF9GX0hBU0hf
UkVQT1JULgo+Pgo+PiBDaGFuZ2VzIGZyb20gdjI6IHJlZm9ybWF0dGVkIHN0cnVjdHVyZSBpbiBw
YXRjaCAxCj4KPiBMb29rcyBnb29kIGJ1dCBJIGNvdW5kIGEgY291cGxlIG1vcmUgbml0cy4gU29y
cnkgSSBtaXNzZWQgdGhlbQo+IG9uIHRoZSBwcmV2aW91cyByZWFkLgoKCkRvIHdlIHdhbnQgdG8g
bWVyZ2UgdGhpcyB3aXRob3V0IHRoZSBhY3R1YWwgdXNlcnMgaW4ga2VybmVsPwoKVGhhbmtzCgoK
Pgo+PiBZdXJpIEJlbmRpdG92aWNoICgzKToKPj4gICAgdmlydGlvLW5ldDogSW50cm9kdWNlIGV4
dGVuZGVkIFJTQyBmZWF0dXJlCj4+ICAgIHZpcnRpby1uZXQ6IEludHJvZHVjZSBSU1MgcmVjZWl2
ZSBzdGVlcmluZyBmZWF0dXJlCj4+ICAgIHZpcnRpby1uZXQ6IEludHJvZHVjZSBoYXNoIHJlcG9y
dCBmZWF0dXJlCj4+Cj4+ICAgaW5jbHVkZS91YXBpL2xpbnV4L3ZpcnRpb19uZXQuaCB8IDEwMCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA5NiBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiAtLSAKPj4gMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
