Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BB273768
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:08:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 817F81506;
	Wed, 24 Jul 2019 18:59:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6EAE01672
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 12:55:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
	(mail-oln040092010037.outbound.protection.outlook.com [40.92.10.37])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id F13AA8A0
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 12:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Axyb3q5gQZngWukGItGRiZszHC83+FxSqIk5aeQATdA=;
	b=tj7ygWgMrqmhPe/OE1SxPN7bZA1W77TCztQ1mk0khi8S3wbFeBAQ30e8ngbBJbahrfbtvjTRMgifMGoZdUVJht2L4LJbvqlyr3f84jUYsvrrvcJ/wHHK9qsrm+kJak72Exz+NuPSnKi6vVkPFDBAX2nMSzxMo/ArdIqozHoDspkDjUqGU3+90MzHh+u6MY7EJa7KSYvuhnFShzSieJfIONw5kiwzSXlHREh2VBSX02Z+gRJSGvf4uhwEf2Ur81FBtAoLA1caYp+YuPN1zhoMWUTlau7pZxYrfYBkiaoT89w0BdzuwK9KNbzssSNtmozKgoapR0IIW1/vGmOCkafysw==
Received: from CO1NAM04FT007.eop-NAM04.prod.protection.outlook.com
	(10.152.90.52) by CO1NAM04HT152.eop-NAM04.prod.protection.outlook.com
	(10.152.90.246) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18;
	Thu, 18 Jul 2019 12:55:50 +0000
Received: from BYAPR14MB3205.namprd14.prod.outlook.com (10.152.90.52) by
	CO1NAM04FT007.mail.protection.outlook.com (10.152.90.85) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.2052.18 via Frontend Transport; Thu, 18 Jul 2019 12:55:50 +0000
Received: from BYAPR14MB3205.namprd14.prod.outlook.com
	([fe80::90b2:404:ecfe:30ab]) by BYAPR14MB3205.namprd14.prod.outlook.com
	([fe80::90b2:404:ecfe:30ab%6]) with mapi id 15.20.2094.011;
	Thu, 18 Jul 2019 12:55:50 +0000
From: ? jiang <jiangkidd@hotmail.com>
To: "mst@redhat.com" <mst@redhat.com>
Subject: [PATCH] virtio-net: parameterize min ring num_free for virtio receive
Thread-Topic: [PATCH] virtio-net: parameterize min ring num_free for virtio
	receive
Thread-Index: AQHVPWggIuOCp2PIFki8Fasred18HQ==
Date: Thu, 18 Jul 2019 12:55:50 +0000
Message-ID: <BYAPR14MB32056583C4963342F5D817C4A6C80@BYAPR14MB3205.namprd14.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0072.prod.exchangelabs.com (2603:10b6:a03:94::49)
	To BYAPR14MB3205.namprd14.prod.outlook.com
	(2603:10b6:a03:ab::18)
x-incomingtopheadermarker: OriginalChecksum:6E947996C4B5B749FAE46A320FFBAAD358F5D971277E5855713D3EC504083D71;
	UpperCasedChecksum:38DFEEFBE7040B13E858E29A2E882BC6C6C5F49857EA18B9ECE6929921856092;
	SizeAsReceived:8168; Count:48
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.11.0
x-tmn: [0uPFzqvjle/+00Oa8rG6GOuk92whCIic]
x-microsoft-original-message-id: <20190718125544.32140-1-jiangkidd@hotmail.com>
x-ms-publictraffictype: Email
x-incomingheadercount: 48
x-eopattributedmessage: 0
x-ms-exchange-slblob-mailprops: 7MJMDUNTCtz8yFZ/v7LNe7Vtepfp+bYPlwb0XHv5L7hkydrZXYQ0eoIDsQ24JmtdHF7H0mSHthqgHgwJDByH5gaEdICSoNQdwjRoaYOU6MW/75FL8gYTPJ8KofxAuuB255hC8n7oe0jdUzT+wJQGRO/eF6PrvqwFYFQZ5SKpWH2mFqsYrcL1PBCOvSrjQvwIb7J+qqHXzUNQJZg/b0EyJ1ihaq6ywath5UIU9x5W4YcXWvDQMXoGyhJOEfCxfO9zbm3gwbntLoB2533vr16B6vqI/hg0yHm17202bIuWR3ZEZl+7Hs/8IUQgNT10pz9AweWOav0cYA2Mu0GvQ9iKhfwk/7hSO/2WnsvNM8WTEu4jj2xtbwB67H2fORu9FiK9i5dK7FlhWtC3FupZotm6SRzwbGYLltRp0gVMKhydoLiZr/5i9Ci96LZKGfLhbB37OZnhikjarmQDzLvyX/CpkSnwZNcwipCrhDJCD7XSkcEBJIb8BnsolMHRMnusZCZCOFMgDPTBTAMf/sML1zPPhmAgk1aVDlF+8/ovy5EqSXYUBHN5tRgCAmnNqxHPIpvuuCo0PhTOQBHJmh4u21b954p5ty/IXNce0iAZEtTndyKzY79WTB1nNEyAGXPvmg4KSUly0ebGTz6UdZlLLAvo36xAasprXL3BFzXhFSYC0gIidOexKHvmYWcJ+9BAb1Z+fwvBQqw2DwPLfQEOWccWlB8hRA6B66xJpJDbqxNY1VJYkCV/PR0VWA==
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(201702181274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);
	SRVR:CO1NAM04HT152; 
x-ms-traffictypediagnostic: CO1NAM04HT152:
x-microsoft-antispam-message-info: m5G1jelB0M4l1EFlzRqqxkLa5TLTUHXfzZek+53sEoUo7KA9SvH+uw1w7eSaSeaKzrGozAsLM6XZnjqlPBUZqUU0oBhRo+wLyx0YQD/droGN6yRjAlLa7C/GsAHyAppihIx1GM4x4UetoNQQMLpN//IRbFUNjYBw9b7klQSLP8WVR3bmavJhzl84yCma3Wmn
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb09907-37df-4f48-4cef-08d70b7f4266
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 12:55:50.2005 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM04HT152
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Wed, 24 Jul 2019 18:59:23 +0000
Cc: "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
	"songliubraving@fb.com" <songliubraving@fb.com>,
	"jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
	"hawk@kernel.org" <hawk@kernel.org>,
	"daniel@iogearbox.net" <daniel@iogearbox.net>,
	"jiangran.jr@alibaba-inc.com" <jiangran.jr@alibaba-inc.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>,
	"ast@kernel.org" <ast@kernel.org>, "kafai@fb.com" <kafai@fb.com>,
	? jiang <jiangkidd@hotmail.com>, "yhs@fb.com" <yhs@fb.com>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

This change makes ring buffer reclaim threshold num_free configurable for better performance, while it's hard coded as 1/2 * queue now.
According to our test with qemu + dpdk, packet dropping happens when the guest is not able to provide free buffer in avail ring timely.
Smaller value of num_free does decrease the number of packet dropping during our test as it makes virtio_net reclaim buffer earlier.

At least, we should leave the value changeable to user while the default value as 1/2 * queue is kept.

Signed-off-by: jiangkidd <jiangkidd@hotmail.com>
---
 drivers/net/virtio_net.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 0d4115c9e20b..bc190dec6084 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -26,6 +26,9 @@
 static int napi_weight = NAPI_POLL_WEIGHT;
 module_param(napi_weight, int, 0444);
 
+static int min_numfree;
+module_param(min_numfree, int, 0444);
+
 static bool csum = true, gso = true, napi_tx;
 module_param(csum, bool, 0444);
 module_param(gso, bool, 0444);
@@ -1315,6 +1318,9 @@ static int virtnet_receive(struct receive_queue *rq, int budget,
 	void *buf;
 	int i;
 
+	if (!min_numfree)
+		min_numfree = virtqueue_get_vring_size(rq->vq) / 2;
+
 	if (!vi->big_packets || vi->mergeable_rx_bufs) {
 		void *ctx;
 
@@ -1331,7 +1337,7 @@ static int virtnet_receive(struct receive_queue *rq, int budget,
 		}
 	}
 
-	if (rq->vq->num_free > virtqueue_get_vring_size(rq->vq) / 2) {
+	if (rq->vq->num_free > min_numfree) {
 		if (!try_fill_recv(vi, rq, GFP_ATOMIC))
 			schedule_delayed_work(&vi->refill, 0);
 	}
-- 
2.11.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
