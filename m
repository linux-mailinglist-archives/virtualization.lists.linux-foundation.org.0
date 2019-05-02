Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8593611407
	for <lists.virtualization@lfdr.de>; Thu,  2 May 2019 09:19:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 24AF72FC2;
	Thu,  2 May 2019 07:19:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 863442F7D
	for <virtualization@lists.linux-foundation.org>;
	Thu,  2 May 2019 07:18:49 +0000 (UTC)
X-Greylist: delayed 00:05:13 by SQLgrey-1.7.6
Received: from mail.a160.static.mgsend.net (mail.a160.static.mgsend.net
	[104.130.123.160])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id F0D718D
	for <virtualization@lists.linux-foundation.org>;
	Thu,  2 May 2019 07:18:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=insticc.info; q=dns/txt;
	s=mailo; t=1556781528; h=Content-Transfer-Encoding: Content-Type:
	Subject: Date: To: From: MIME-Version: Message-Id: Sender;
	bh=hBamrcyTj9u6hn8vx1jKo1y8LZiYjMGR2XaFqtmw7P8=;
	b=100W+IHv5kCDReerSGy/u/guj4vZzElwfMWHCft4dhQZYrLqhh9bTQ27corp0aNt+jJKOsFV
	d/RScBBgd0ZSUV8gLbkfCM8LmQDo8sq4GyoEfnZEK5NM0rUdSWz8OETHPHL710uyJUmmgUPj
	xHa3WX/PbOep/H2w+A4eDJ7gK2g=
X-Mailgun-Sending-Ip: 104.130.123.160
X-Mailgun-Sid: WyIxNzQ3NCIsICJ2aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICIzODY1ZmQiXQ==
Message-Id: <20190502071345.1.6BC1B18F64A3ED86@insticc.info>
Received: from PLADVMHost (pal-213-228-151-36.netvisao.pt [213.228.151.36])
	by mxa.mailgun.org with ESMTP id 5cca98a9.7fd3da6dc030-smtp-out-n03;
	Thu, 02 May 2019 07:13:45 -0000 (UTC)
MIME-Version: 1.0
From: "peccs@insticc.info" <peccs@insticc.info>
To: virtualization@lists.linux-foundation.org
Date: 2 May 2019 08:13:50 +0100
Subject: CFP PECCS 2019 - 9th Int.l Conf. on Pervasive and Embedded
	Computing and Communication Systems (Vienna/Austria)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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

U1VCTUlTU0lPTiBERUFETElORSAKCjl0aCBJbnRlcm5hdGlvbmFsIENvbmZlcmVuY2Ugb24gUGVy
dmFzaXZlIGFuZCBFbWJlZGRlZCBDb21wdXRpbmcgYW5kIENvbW11bmljYXRpb24gU3lzdGVtcwoK
U3VibWlzc2lvbiBEZWFkbGluZTogTWF5IDIwLCAyMDE5CgpodHRwOi8vd3d3LnBlY2NzLm9yZy8K
ClNlcHRlbWJlciAxOSAtIDIwLCAyMDE5ClZpZW5uYSwgQXVzdHJpYS4KCiBQRUNDUyBpcyBvcmdh
bml6ZWQgaW4gNSBtYWpvciB0cmFja3M6CgogLSBXaXJlbGVzcyBhbmQgTW9iaWxlIFRlY2hub2xv
Z2llcwogLSBTZW5zb3IgTmV0d29ya3M6IFNvZnR3YXJlLCBBcmNoaXRlY3R1cmVzIGFuZCBBcHBs
aWNhdGlvbnPCoAogLSBJbnRlbGxpZ2VudCBEYXRhIEFuYWx5c2lzIGFuZCBQcm9jZXNzaW5nCiAt
IE1vYmlsZSBDb21wdXRpbmcgU3lzdGVtcyBhbmQgU2VydmljZXMKIC0gTXVsdGltZWRpYSBTaWdu
YWwgUHJvY2Vzc2luZ8KgCgoNCkluIENvb3BlcmF0aW9uIHdpdGg6IEFJKklBLCBBUFBJQSwgRVJD
SU0gYW5kIEFQUlAuIA0KICAgICAgICAgICAgICAgICAgICANClByb2NlZWRpbmdzIHdpbGwgYmUg
c3VibWl0dGVkIGZvciBpbmRleGF0aW9uIGJ5OiBEQkxQLCBUaG9tc29uIFJldXRlcnMsIEVJLCBT
Q09QVVMsIFNlbWFudGljIFNjaG9sYXIgYW5kIEdvb2dsZSBTY2hvbGFyLiANCiAgICAgICAgICAg
ICAgICAgICAgCiAKV2l0aCB0aGUgcHJlc2VuY2Ugb2YgaW50ZXJuYXRpb25hbGx5IGRpc3Rpbmd1
aXNoZWQga2V5bm90ZSBzcGVha2VyczoKQW5kcmVhcyBIb2x6aW5nZXIsIE1lZGljYWwgVW5pdmVy
c2l0eSBHcmF6LCBBdXN0cmlhCktheXlhbGkgTW9oYW1lZCwgSW50ZXJuYXRpb25hbCBGZWRlcmF0
aW9uIG9mIEdsb2JhbCAmIEdyZWVuIEluZm9ybWF0aW9uIENvbW11bnVjYXRpb24gVGVjaG5vbG9n
eSwgVW5pdGVkIFN0YXRlcwoKCkEgc2hvcnQgbGlzdCBvZiBwcmVzZW50ZWQgcGFwZXJzIHdpbGwg
YmUgc2VsZWN0ZWQgc28gdGhhdCByZXZpc2VkIGFuZCBleHRlbmRlZCB2ZXJzaW9ucyBvZiB0aGVz
ZSBwYXBlcnMgd2lsbCBiZSBwdWJsaXNoZWQgYnkgU3ByaW5nZXIuCiAKQWxsIHBhcGVycyBwcmVz
ZW50ZWQgYXQgdGhlIGNvbmdyZXNzIHZlbnVlIHdpbGwgYWxzbyBiZSBhdmFpbGFibGUgYXQgdGhl
IFNDSVRFUFJFU1MgRGlnaXRhbCBMaWJyYXJ5IChodHRwOi8vd3d3LnNjaXRlcHJlc3Mub3JnL0Rp
Z2l0YWxMaWJyYXJ5LykuCiAgClNob3VsZCB5b3UgaGF2ZSBhbnkgcXVlc3Rpb24gcGxlYXNlIGRv
bid0IGhlc2l0YXRlIGNvbnRhY3RpbmcgbWUuCiAKCktpbmQgcmVnYXJkcywKUEVDQ1MgU2VjcmV0
YXJpYXQKCkFkZHJlc3M6IEF2ZW5pZGEgZGUgUy4gRnJhbmNpc2NvIFhhdmllciwgTG90ZSA3IEN2
LiBMCjI5MTAtNTk1IFNldHViYWwsIFBvcnR1Z2FsClRlbDogKzM1MSAyNjUgNTIwIDE4NQpGYXg6
ICszNTEgMjY1IDUyMCAxODYKV2ViOiBodHRwOi8vd3d3LnBlY2NzLm9yZy8KZS1tYWlsOiBwZWNj
cy5zZWNyZXRhcmlhdEBpbnN0aWNjLm9yZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0
aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
