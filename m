Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6468819D050
	for <lists.virtualization@lfdr.de>; Fri,  3 Apr 2020 08:38:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 03031203AE;
	Fri,  3 Apr 2020 06:38:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wg4afNTjylCl; Fri,  3 Apr 2020 06:38:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 053152155D;
	Fri,  3 Apr 2020 06:38:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE5EAC07FF;
	Fri,  3 Apr 2020 06:38:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0CED7C07FF
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 06:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 03143869BA
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 06:38:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i9I1dvJX8pV7
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 06:38:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9A4AD8696A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 06:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585895918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FoY5mkBeMkeyo7y0OE/A/cmKtuN2NtQ3ZqEZt21GFCU=;
 b=JOs8mhcpwBwN7CcSN8nwi11iXvkNcHpgCX5vOVejgSUqyZSydgWYMq7Qhg7S38uOfo8zZD
 i7dm6XQnqsLNlLQDAYn/cJ60S3Cd2EFIJ+EH2XkOhx+E1dLz+lrSq8m/LSdOvLDTjd1cAL
 UQOiqweddHyHnVfP/Ph+PtaX54zTFvs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-pOpQyYxoPhyAEITttS26fg-1; Fri, 03 Apr 2020 02:38:34 -0400
X-MC-Unique: pOpQyYxoPhyAEITttS26fg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A9298017CE;
 Fri,  3 Apr 2020 06:38:33 +0000 (UTC)
Received: from [10.72.13.110] (ovpn-13-110.pek2.redhat.com [10.72.13.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A2B094960;
 Fri,  3 Apr 2020 06:38:29 +0000 (UTC)
Subject: Re: [PATCH v2] vhost: drop vring dependency on iotlb
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200402144519.34194-1-mst@redhat.com>
 <44f9b9d3-3da2-fafe-aa45-edd574dc6484@redhat.com>
 <20200402122544-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f811f02e-5681-33c0-f970-f60c62ff0041@redhat.com>
Date: Fri, 3 Apr 2020 14:38:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200402122544-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

Ck9uIDIwMjAvNC8zIOS4iuWNiDEyOjI3LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VGh1LCBBcHIgMDIsIDIwMjAgYXQgMTE6MDE6MTNQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAyMC80LzIg5LiL5Y2IMTA6NDYsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+
IHZyaW5naCBjYW4gbm93IGJlIGJ1aWx0IHdpdGhvdXQgSU9UTEIuCj4+PiBTZWxlY3QgSU9UTEIg
ZGlyZWN0bHkgd2hlcmUgaXQncyB1c2VkLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwg
Uy4gVHNpcmtpbjxtc3RAcmVkaGF0LmNvbT4KPj4+IC0tLQo+Pj4KPj4+IEFwcGxpZXMgb24gdG9w
IG9mIG15IHZob3N0IHRyZWUuCj4+PiBDaGFuZ2VzIGZyb20gdjE6Cj4+PiAJVkRQQV9TSU0gbmVl
ZHMgVkhPU1RfSU9UTEIKPj4gSXQgbG9va3MgdG8gbWUgdGhlIHBhdGNoIGlzIGlkZW50aWNhbCB0
byB2MS4KPj4KPj4gVGhhbmtzCj4geW91IGFyZSByaWdodC4gSSBzcXVhc2hlZCB0aGUgZGVzY3Jp
cHRpb24gaW50bwo+ICAgICAgdmlydGlvL3Rlc3Q6IGZpeCB1cCBhZnRlciBJT1RMQiBjaGFuZ2Vz
Cj4gdGFrZSBhIGxvb2sgYXQgaXQgaW4gdGhlIHZob3N0IHRyZWUuCgoKTG9va3MgZmluZS4KClRo
YW5rcwoKCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
ClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1m
b3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9s
aXN0aW5mby92aXJ0dWFsaXphdGlvbg==
