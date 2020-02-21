Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C80CC1678B2
	for <lists.virtualization@lfdr.de>; Fri, 21 Feb 2020 09:50:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7486984CCE;
	Fri, 21 Feb 2020 08:50:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yUNE1j8sCo6L; Fri, 21 Feb 2020 08:50:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D058D86B11;
	Fri, 21 Feb 2020 08:50:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9EAC2C1D8E;
	Fri, 21 Feb 2020 08:50:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3C885C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 08:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 282DE84CCE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 08:50:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dyaMw8GELj+v
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 08:50:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 35EB5869E1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 08:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582275031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EXWvx43O9g/ijJ52j/YuLCYIbjQQg+Dy1xNnaG2kadU=;
 b=ffv3OMEhOl1ikMBkfvWep9kyYX7qQjxP4EJ5Vdkh4HtLcTg3FAH5MBLJHGT/FqNkm4ildw
 a5cODwZmnv/T6hx82vMkacFeJaXPDpb5oF2Akpgr8nKHK36+vWq+bdYDaebw2dYepuAuC8
 hx7ACIxuJaNXdaw6fHi1Ak6sEGNLx/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-JRoNw5u6PxuSrSphnI0hbA-1; Fri, 21 Feb 2020 03:50:30 -0500
X-MC-Unique: JRoNw5u6PxuSrSphnI0hbA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70707107ACC9;
 Fri, 21 Feb 2020 08:50:27 +0000 (UTC)
Received: from [10.72.13.208] (ovpn-13-208.pek2.redhat.com [10.72.13.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87ECB5DD73;
 Fri, 21 Feb 2020 08:50:11 +0000 (UTC)
Subject: Re: [PATCH V4 5/5] vdpasim: vDPA device simulator
To: Harpreet Singh Anand <hanand@xilinx.com>, "mst@redhat.com"
 <mst@redhat.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <20200220061141.29390-1-jasowang@redhat.com>
 <20200220061141.29390-6-jasowang@redhat.com>
 <BY5PR02MB637195ECE0879F5F7CB72CE3BB120@BY5PR02MB6371.namprd02.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2c0ad54d-c8bd-bb2e-5dff-ce79cf0d45b9@redhat.com>
Date: Fri, 21 Feb 2020 16:50:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <BY5PR02MB637195ECE0879F5F7CB72CE3BB120@BY5PR02MB6371.namprd02.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: "shahafs@mellanox.com" <shahafs@mellanox.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "jiri@mellanox.com" <jiri@mellanox.com>, "lulu@redhat.com" <lulu@redhat.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "jgg@mellanox.com" <jgg@mellanox.com>,
 "parav@mellanox.com" <parav@mellanox.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>
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

Ck9uIDIwMjAvMi8yMSDkuIvljYg0OjMzLCBIYXJwcmVldCBTaW5naCBBbmFuZCB3cm90ZToKPiAr
ICAgICAgIHJldCA9IGRldmljZV9yZWdpc3RlcigmdmRwYXNpbS0+ZGV2KTsKPiArICAgICAgIGlm
IChyZXQpCj4gKyAgICAgICAgICAgICAgIGdvdG8gZXJyX2luaXQ7Cj4gKwo+ICsgICAgICAgdmRw
YXNpbS0+dmRwYSA9IHZkcGFfYWxsb2NfZGV2aWNlKGRldiwgZGV2LCAmdmRwYXNpbV9uZXRfY29u
ZmlnX29wcyk7Cj4gKyAgICAgICBpZiAocmV0KQo+ICsgICAgICAgICAgICAgICBnb3RvIGVycl92
ZHBhOwo+Cj4gW0hTQV0gSW5jb3JyZWN0IGNoZWNraW5nIG9mIHRoZSByZXR1cm4gdmFsdWUgb2Yg
dmRwYV9hbGxvY19kZXZpY2UuCgoKWWVzLCBmaXhlZC4KClRoYW5rcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
