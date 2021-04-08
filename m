Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2E2357FA3
	for <lists.virtualization@lfdr.de>; Thu,  8 Apr 2021 11:45:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D9FD60A4A;
	Thu,  8 Apr 2021 09:45:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e1rlsYnrnK1L; Thu,  8 Apr 2021 09:45:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4755160DA7;
	Thu,  8 Apr 2021 09:45:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7374C000A;
	Thu,  8 Apr 2021 09:45:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B63F2C000A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 09:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4E86404B0
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 09:45:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bVXoAlApxhem
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 09:45:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C0C4400E7
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 09:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617875135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x7I3DmGLXrsRyzlHfy6cDu8vSs80M025TjfxeEvur9E=;
 b=YFxH+WqQYamGPRmb5WY0IDIyIuqXaIKf7T2rl4jUNXnGtOTErvHVPg6JWedUXYXSQWEnYI
 x2UNSpj+AWVvJJnJmwPYEGglQpppGmRCaMidNXfDbSyV3CckEGTibnY+IPI/s8vOHm4szB
 nOACuI1lYNPcl5OU5lEC64uRIaizvPI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-Xl-Ef9tEPrWyv8Gfc99AZA-1; Thu, 08 Apr 2021 05:45:32 -0400
X-MC-Unique: Xl-Ef9tEPrWyv8Gfc99AZA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02FBA6D241;
 Thu,  8 Apr 2021 09:45:31 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-53.pek2.redhat.com
 [10.72.13.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E52CF5D9CA;
 Thu,  8 Apr 2021 09:45:23 +0000 (UTC)
Subject: Re: [PATCH 3/5] vdpa/mlx5: Retrieve BAR address suitable any function
To: Eli Cohen <elic@nvidia.com>, mst@redhat.com, parav@nvidia.com,
 si-wei.liu@oracle.com, virtualization@lists.linux-foundation.org,
 netdev@vger.kernel.org
References: <20210408091047.4269-1-elic@nvidia.com>
 <20210408091047.4269-4-elic@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <67feb53c-91dc-f299-0c83-ce459cb0da5e@redhat.com>
Date: Thu, 8 Apr 2021 17:45:22 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408091047.4269-4-elic@nvidia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: stable@vger.kernel.org
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

CtTaIDIwMjEvNC84IM/Czuc1OjEwLCBFbGkgQ29oZW4g0LS1wDoKPiBzdHJ1Y3QgbWx4NV9jb3Jl
X2RldiBoYXMgYSBiYXJfYWRkciBmaWVsZCB0aGF0IGNvbnRhaW5zIHRoZSBjb3JyZWN0IGJhcgo+
IGFkZHJlc3MgZm9yIHRoZSBmdW5jdGlvbiByZWdhcmRsZXNzIG9mIHdoZXRoZXIgaXQgaXMgcGNp
IGZ1bmN0aW9uIG9yIHN1Ygo+IGZ1bmN0aW9uLiBVc2UgaXQuCj4KPiBGaXhlczogMTk1OGZjMmYw
NzEyICgibmV0L21seDU6IFNGLCBBZGQgYXV4aWxpYXJ5IGRldmljZSBkcml2ZXIiKQo+IFNpZ25l
ZC1vZmYtYnk6IEVsaSBDb2hlbiA8ZWxpY0BudmlkaWEuY29tPgo+IFJldmlld2VkLWJ5OiBQYXJh
diBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+CgoKQWNrZWQtYnk6IEphc29uIFdhbmcgPGphc293
YW5nQHJlZGhhdC5jb20+CgoKPiAtLS0KPiAgIGRyaXZlcnMvdmRwYS9tbHg1L2NvcmUvcmVzb3Vy
Y2VzLmMgfCAzICsrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmRwYS9tbHg1L2NvcmUvcmVzb3VyY2Vz
LmMgYi9kcml2ZXJzL3ZkcGEvbWx4NS9jb3JlL3Jlc291cmNlcy5jCj4gaW5kZXggOTZlNjQyMWM1
ZDFjLi42NTIxY2JkMGY1YzIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92ZHBhL21seDUvY29yZS9y
ZXNvdXJjZXMuYwo+ICsrKyBiL2RyaXZlcnMvdmRwYS9tbHg1L2NvcmUvcmVzb3VyY2VzLmMKPiBA
QCAtMjQ2LDcgKzI0Niw4IEBAIGludCBtbHg1X3ZkcGFfYWxsb2NfcmVzb3VyY2VzKHN0cnVjdCBt
bHg1X3ZkcGFfZGV2ICptdmRldikKPiAgIAlpZiAoZXJyKQo+ICAgCQlnb3RvIGVycl9rZXk7Cj4g
ICAKPiAtCWtpY2tfYWRkciA9IHBjaV9yZXNvdXJjZV9zdGFydChtZGV2LT5wZGV2LCAwKSArIG9m
ZnNldDsKPiArCWtpY2tfYWRkciA9IG1kZXYtPmJhcl9hZGRyICsgb2Zmc2V0Owo+ICsKPiAgIAly
ZXMtPmtpY2tfYWRkciA9IGlvcmVtYXAoa2lja19hZGRyLCBQQUdFX1NJWkUpOwo+ICAgCWlmICgh
cmVzLT5raWNrX2FkZHIpIHsKPiAgIAkJZXJyID0gLUVOT01FTTsKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlz
dApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
