Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F338B690
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 13:24:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A47F5CA1;
	Tue, 13 Aug 2019 11:24:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id ED9F9C7C
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 11:24:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A6045CF
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 11:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=K5gbxcQPxrQYgws2hBkB1SH1ZLrBAecYkptVmkU/CGk=;
	b=VBhkUStRQ4A8I1CFq/DgEvG8QK
	mabjskg5FBYy57JI09/XJ+irmmluQEyFn85/SuN/45HNd3U/QuZsVBL+T1q44y1YuhmwXhFeFOIid
	5+TJqYzbYBR4TAQdkn+yPCLlhGjXlAQ8gSeXgktbYEHsVXCJu8vfkH90LYiZ3gbC2jrirPL9ZU49S
	/bvRIf8M2YA5toVEmvi1MpyRuNiS+3/VfzBQLmxvSpGFqj7t8TBqpby1yVIj97hYNPOiRJd/2Xg35
	YvvqIbffdEJSygJyMOOoqy74tKwa9u0wy1prWkxOhDCrSmHHMkfHeNaDXuascaWKuA3U2Y6cCpTEG
	zW2hQB3Q==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92 #3 (Red
	Hat Linux)) id 1hxUuO-0006tv-Eu; Tue, 13 Aug 2019 11:24:08 +0000
Date: Tue, 13 Aug 2019 04:24:08 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: DANGER WILL ROBINSON, DANGER
Message-ID: <20190813112408.GC5307@bombadil.infradead.org>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-72-alazar@bitdefender.com>
	<20190809162444.GP5482@bombadil.infradead.org>
	<ae0d274c-96b1-3ac9-67f2-f31fd7bbdcee@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ae0d274c-96b1-3ac9-67f2-f31fd7bbdcee@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>,
	Yu C <yu.c.zhang@intel.com>, kvm@vger.kernel.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Samuel =?iso-8859-1?Q?Laur=E9n?= <samuel.lauren@iki.fi>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
	virtualization@lists.linux-foundation.org,
	Adalbert =?utf-8?B?TGF6xINy?= <alazar@bitdefender.com>,
	linux-mm@kvack.org, Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Zhang@kvack.org,
	Mircea =?iso-8859-1?Q?C=EErjaliu?= <mcirjaliu@bitdefender.com>,
	Mihai =?utf-8?B?RG9uyJt1?= <mdontu@bitdefender.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMTE6Mjk6MDdBTSArMDIwMCwgUGFvbG8gQm9uemluaSB3
cm90ZToKPiBPbiAwOS8wOC8xOSAxODoyNCwgTWF0dGhldyBXaWxjb3ggd3JvdGU6Cj4gPiBPbiBG
cmksIEF1ZyAwOSwgMjAxOSBhdCAwNzowMDoyNlBNICswMzAwLCBBZGFsYmVydCBMYXrEg3Igd3Jv
dGU6Cj4gPj4gKysrIGIvaW5jbHVkZS9saW51eC9wYWdlLWZsYWdzLmgKPiA+PiBAQCAtNDE3LDgg
KzQxNywxMCBAQCBQQUdFRkxBRyhJZGxlLCBpZGxlLCBQRl9BTlkpCj4gPj4gICAqLwo+ID4+ICAj
ZGVmaW5lIFBBR0VfTUFQUElOR19BTk9OCTB4MQo+ID4+ICAjZGVmaW5lIFBBR0VfTUFQUElOR19N
T1ZBQkxFCTB4Mgo+ID4+ICsjZGVmaW5lIFBBR0VfTUFQUElOR19SRU1PVEUJMHg0Cj4gPiBVaC4g
IEhvdyBkbyB5b3Uga25vdyBwYWdlLT5tYXBwaW5nIHdvdWxkIG90aGVyd2lzZSBoYXZlIGJpdCAy
IGNsZWFyPwo+ID4gV2hvJ3MgZ3VhcmFudGVlaW5nIHRoYXQ/Cj4gPiAKPiA+IFRoaXMgaXMgYW4g
YXdmdWxseSBiaWcgcGF0Y2ggdG8gdGhlIG1lbW9yeSBtYW5hZ2VtZW50IGNvZGUsIGJ1cmllZCBp
bgo+ID4gdGhlIG1pZGRsZSBvZiBhIGdpZ2FudGljIHNlcmllcyB3aGljaCBhbG1vc3QgZ3VhcmFu
dGVlcyBub2JvZHkgd291bGQKPiA+IGxvb2sgYXQgaXQuICBJIGNhbGwgc2hlbmFuaWdhbnMuCj4g
Cj4gQXJlIHlvdSBjYWxsaW5nIHNoZW5hbmlnYW5zIG9uIHRoZSBwYXRjaCBzdWJtaXR0ZXIgKHdo
aWNoIGlzIGdyYXR1aXRvdXMpCj4gb3Igb24gdGhlIEtWTSBtYWludGFpbmVycy9yZXZpZXdlcnM/
CgpPbiB0aGUgcGF0Y2ggc3VibWl0dGVyLCBvZiBjb3Vyc2UuICBIb3cgY2FuIEkgcG9zc2libHkg
YmUgY3JpdGljaXNpbmcgeW91CmZvciBzb21ldGhpbmcgeW91IGRpZG4ndCBkbz8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
