Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA49EFD9E
	for <lists.virtualization@lfdr.de>; Tue,  5 Nov 2019 13:49:11 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 991631475;
	Tue,  5 Nov 2019 12:48:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7DA671475
	for <virtualization@lists.linux-foundation.org>;
	Tue,  5 Nov 2019 12:48:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 247718AA
	for <virtualization@lists.linux-foundation.org>;
	Tue,  5 Nov 2019 12:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572958122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=2jEVDWNch/xYgmO6OEN+wbzCxr5VY9dJ1NypSvMkGAk=;
	b=Au9Z0pKOIFUiV7USCxLar/8ex0Sa6NwU3XtbM+uI6vCScReZ0Rwd2HR6n1dI9UIn2mEqVo
	d057pYUgub1O6GhYEwnTQdLhX6O+3mJI5Kj7E9QJJvhosR7ePRvkxuQR/cjc+WaAqWd1Td
	bl3fuZ8rj2YRVstZDfd15CiByhgHYbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-327-MXpRGnxXNxOf2pXTLPnBXA-1; Tue, 05 Nov 2019 07:48:38 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EC151005500;
	Tue,  5 Nov 2019 12:48:36 +0000 (UTC)
Received: from [10.72.12.252] (ovpn-12-252.pek2.redhat.com [10.72.12.252])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 069201001B00;
	Tue,  5 Nov 2019 12:48:04 +0000 (UTC)
Subject: Re: [PATCH 1/2] IFC hardware operation layer
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>
References: <1572946660-26265-1-git-send-email-lingshan.zhu@intel.com>
	<1572946660-26265-2-git-send-email-lingshan.zhu@intel.com>
	<20191105074309-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9506db6b-ae68-271d-5e13-411715811131@redhat.com>
Date: Tue, 5 Nov 2019 20:47:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191105074309-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: MXpRGnxXNxOf2pXTLPnBXA-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, jason.zeng@intel.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvMTEvNSDkuIvljYg4OjQ1LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+ICsK
Pj4gKyNkZWZpbmUgSUZDX1NVUFBPUlRFRF9GRUFUVVJFUyBcCj4+ICsJCSgoMVVMTCA8PCBWSVJU
SU9fTkVUX0ZfTUFDKQkJCXwgXAo+PiArCQkgKDFVTEwgPDwgVklSVElPX0ZfQU5ZX0xBWU9VVCkJ
CQl8IFwKPj4gKwkJICgxVUxMIDw8IFZJUlRJT19GX1ZFUlNJT05fMSkJCQl8IFwKPj4gKwkJICgx
VUxMIDw8IFZJUlRJT19GX09SREVSX1BMQVRGT1JNKQkJCXwgXAo+IEFDQ0VTU19QTEFURk9STSBt
dXN0IGJlIGVuYWJsZWQgZm9yIHN1cmU/Cj4KPgoKSSB0aGluayBzbywgY29uc2lkZXIgdmhvc3Qt
bWRldiBjYW4gZmlsdGVyIGl0IG91dCByaWdodCBub3cuCgpUaGFua3MKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
