Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 479A82B3BF6
	for <lists.virtualization@lfdr.de>; Mon, 16 Nov 2020 05:02:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D2C3485F8A;
	Mon, 16 Nov 2020 04:02:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 170IeXyYvfTs; Mon, 16 Nov 2020 04:02:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7E28B85F88;
	Mon, 16 Nov 2020 04:02:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C9A7C07FF;
	Mon, 16 Nov 2020 04:02:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07843C07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 04:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E839C86FC4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 04:02:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2iuE4UViNMHQ
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 04:02:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E2CC281AEE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 04:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605499359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+x1sdSjYElIzbzoPa6Ux6ilBlwEfssp+DCBplfeClMs=;
 b=WzzIqz07W2i3BrKddWmlRSQvBZozfa0nWyXUiCHhB1YPle495qlIbGeEbGT0UynTi9KwdY
 cXVlp0V7Ox2d8iM9kCwLeO0BAsDufeoF+BxERynViqnHZQmKsI5TE6T+QsdFleJNX5MPUi
 ixwVkDfb/UL08NJh33pglJR8sCViAv4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-K-jWbgH0POSB2x4eLQa0bQ-1; Sun, 15 Nov 2020 23:02:38 -0500
X-MC-Unique: K-jWbgH0POSB2x4eLQa0bQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9C3D100747F;
 Mon, 16 Nov 2020 04:02:36 +0000 (UTC)
Received: from [10.72.13.126] (ovpn-13-126.pek2.redhat.com [10.72.13.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D74B10002A4;
 Mon, 16 Nov 2020 04:02:27 +0000 (UTC)
Subject: Re: [PATCH RFC 03/12] vdpa_sim: remove hard-coded virtq count
To: Stefano Garzarella <sgarzare@redhat.com>,
 virtualization@lists.linux-foundation.org
References: <20201113134712.69744-1-sgarzare@redhat.com>
 <20201113134712.69744-4-sgarzare@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a24092dd-bca8-4acb-0c6a-e8da46525b51@redhat.com>
Date: Mon, 16 Nov 2020 12:02:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201113134712.69744-4-sgarzare@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <elic@nvidia.com>
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

Ck9uIDIwMjAvMTEvMTMg5LiL5Y2IOTo0NywgU3RlZmFubyBHYXJ6YXJlbGxhIHdyb3RlOgo+IEZy
b206IE1heCBHdXJ0b3ZveSA8bWd1cnRvdm95QG52aWRpYS5jb20+Cj4KPiBBZGQgYSBuZXcgYXR0
cmlidXRlIHRoYXQgd2lsbCBkZWZpbmUgdGhlIG51bWJlciBvZiB2aXJ0IHF1ZXVlcyB0byBiZQo+
IGNyZWF0ZWQgZm9yIHRoZSB2ZHBhc2ltIGRldmljZS4KPgo+IFNpZ25lZC1vZmYtYnk6IE1heCBH
dXJ0b3ZveSA8bWd1cnRvdm95QG52aWRpYS5jb20+Cj4gW3NnYXJ6YXJlOiByZXBsYWNlIGttYWxs
b2NfYXJyYXkoKSB3aXRoIGtjYWxsb2MoKV0KPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIEdhcnph
cmVsbGEgPHNnYXJ6YXJlQHJlZGhhdC5jb20+Cj4gLS0tCj4gdjE6Cj4gLSB1c2Uga2NhbGxvYygp
IGluc3RlYWQgb2Yga21hbGxvY19hcnJheSgpIHNpbmNlIHNvbWUgZnVuY3Rpb24gZXhwZWN0cwo+
ICAgIHZhcmlhYmxlcyBpbml0aWFsaXplZCB0byB6ZXJvCgoKTG9va3MgZ29vZCwgb25lIG5pdCwg
SSBwcmVmZXIgdG8gZG8gdGhpcyBiZWZvcmUgcGF0Y2ggMi4KClRoYW5rcwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
