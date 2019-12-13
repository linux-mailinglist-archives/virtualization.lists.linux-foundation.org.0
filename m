Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F6111E13D
	for <lists.virtualization@lfdr.de>; Fri, 13 Dec 2019 10:55:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4A150888C2;
	Fri, 13 Dec 2019 09:55:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rLUJycmM-+39; Fri, 13 Dec 2019 09:55:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DC24C88B10;
	Fri, 13 Dec 2019 09:55:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C09FEC0881;
	Fri, 13 Dec 2019 09:55:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2EC5DC0881
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 09:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 14D7087141
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 09:55:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EH1qy1n5NXzG
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 09:55:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BA6AB870A1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 09:55:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 671E6B291;
 Fri, 13 Dec 2019 09:55:36 +0000 (UTC)
Subject: Re: [PATCH] virtio-blk: remove VIRTIO_BLK_F_SCSI support
To: Christoph Hellwig <hch@lst.de>, axboe@kernel.dk, mst@redhat.com,
 jasowang@redhat.com, pbonzini@redhat.com, stefanha@redhat.com
References: <20191212163719.28432-1-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <f6b110d8-2f13-94e9-0b11-92e2c103f7d6@suse.de>
Date: Fri, 13 Dec 2019 10:55:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191212163719.28432-1-hch@lst.de>
Content-Language: en-US
Cc: linux-block@vger.kernel.org, virtualization@lists.linux-foundation.org
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

T24gMTIvMTIvMTkgNTozNyBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gU2luY2UgdGhl
IG5lZWQgZm9yIGEgc3BlY2lhbCBmbGFnIHRvIHN1cHBvcnQgU0NTSSBwYXNzdGhyb3VnaCBvbiBh
Cj4gYmxvY2sgZGV2aWNlIHdhcyBhZGRlZCBpbiBNYXkgMjAxNyB0aGUgU0NTSSBwYXNzdGhyb3Vn
aCBzdXBwb3J0IGluCj4gdmlydGlvLWJsayBoYXMgYmVlbiBkaXNhYmxlZC4gIEl0IGhhcyBhbHdh
eXMgYmVlbiBhIGJhZCBpZGVhCj4gKGp1c3QgYXNrIHRoZSBvcmlnaW5hbCBhdXRob3IuLikgYW5k
IHdlIGhhdmUgdmlydGlvLXNjc2kgZm9yIHByb3Blcgo+IHBhc3N0aHJvdWdoLiAgVGhlIGZlYXR1
cmUgYWxzbyBuZXZlciBtYWRlIGl0IGludG8gdGhlIHZpcnRpbyAxLjAKPiBvciBsYXRlciBzcGVj
aWZpY2F0aW9ucy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4KPiAtLS0KPiAgIGFyY2gvcG93ZXJwYy9jb25maWdzL2d1ZXN0LmNvbmZpZyB8ICAgMSAt
Cj4gICBkcml2ZXJzL2Jsb2NrL0tjb25maWcgICAgICAgICAgICAgfCAgMTAgLS0tCj4gICBkcml2
ZXJzL2Jsb2NrL3ZpcnRpb19ibGsuYyAgICAgICAgfCAxMTUgKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4gICAzIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMjUgZGVsZXRp
b25zKC0pCj4gCkknbSBhbGwgZm9yIGl0LgoKUmV2aWV3ZWQtYnk6IEhhbm5lcyBSZWluZWNrZSA8
aGFyZUBzdXNlLmRlPgoKQ2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAg
ICAgICAgICAgVGVhbWxlYWQgU3RvcmFnZSAmIE5ldHdvcmtpbmcKaGFyZUBzdXNlLmRlICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkg
KEFHIE7DvHJuYmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
